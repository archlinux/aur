# Maintainer: Erhan Karabulut <x9x@keemail.me>
# Based on john-git PKGBUILD

pkgname=john-bj-git
pkgver=1.9.0.Jumbo.1.1832.gcb0c337e7
pkgrel=1
pkgdesc="John the Ripper – bleeding-jumbo branch (all features enabled)"
arch=('x86_64' 'aarch64' 'i686')
url="https://www.openwall.com/john/"
license=('GPL2' 'custom')

depends=('openssl' 'gmp' 'libpcap' 'openmpi' 'gcc-libs' 'opencl-icd-loader' 'krb5' 'nss' 'libtirpc' 'libxcrypt-compat')
makedepends=('git' 'opencl-headers' 'libxml2' 'libgsf' 'rpcsvc-proto' 'libxcrypt' 'libxcrypt-compat')
optdepends=(
    'perl: helper scripts'
    'ruby: helper scripts'
    'python: helper scripts'
    'python-scapy: oracle2john'
)

provides=('john')
conflicts=('john')
backup=('etc/john/john.conf')
options=('!strip')
source=("john::git+https://github.com/openwall/john.git#branch=bleeding-jumbo")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/john"
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/john/src"
    export CPPFLAGS="-I/usr/include/tirpc"
    export LDFLAGS="-ltirpc"

    local common_opts=(
        --prefix=/usr
        --with-systemwide
        --disable-native-tests
        --enable-openmp
        --enable-mpi
        --enable-opencl
        --enable-pkg-config
        --enable-pcap
    )

    case "$CARCH" in
        x86_64)
            CFLAGS="${CFLAGS/-march=*}" ./configure "${common_opts[@]}"
            make clean && make
            mv ../run/john ../run/john-non-xop
            ./configure "${common_opts[@]}" CFLAGS="$CFLAGS -mavx"
            make clean && make
            mv ../run/john ../run/john-non-avx
            ./configure "${common_opts[@]}" CFLAGS="$CFLAGS -mxop"
            make clean && make
            mv ../run/john ../run/john-xop
            ;;
        i686)
            for flag in "" -mmmx -msse2 -mavx -mxop; do
                [[ $flag ]] && CFLAGS="$CFLAGS $flag"
                ./configure "${common_opts[@]}" CFLAGS="$CFLAGS"
                make clean && make
                [[ $flag ]] && mv ../run/john "../run/john-${flag#-}"
            done
            ;;
        aarch64|*)
            ./configure "${common_opts[@]}" CFLAGS="$CFLAGS"
            make clean && make
            ;;
    esac

    [[ -x ../run/john-non-xop ]] || { echo "FATAL: john binary not built"; return 1; }
}

package() {
    cd "$srcdir/john"

    # main binaries
    install -Dm755 run/john-non-xop "$pkgdir/usr/bin/john"
    for cpu in non-avx non-sse2 non-mmx xop; do
        [[ -e run/john-$cpu ]] && install -Dm755 run/john-$cpu "$pkgdir/usr/bin/john-$cpu"
    done

    # helper links
    for link in unshadow unafs unique undrop rar2john zip2john gpg2john base64conv; do
        ln -sf /usr/bin/john "$pkgdir/usr/bin/$link"
    done

    # scripts
    mkdir -p "$pkgdir/usr/lib/john"
    install -m755 run/{*.py,*.pl,*.rb,*.lua,mailer,benchmark-unify} -t "$pkgdir/usr/lib/john" 2>/dev/null || true
    for ext in pl py rb lua; do
        for s in "$pkgdir"/usr/lib/john/*."$ext"; do
            [[ -e $s ]] && ln -sf "/usr/lib/john/${s##*/}" "$pkgdir/usr/bin/${s##*/}"
        done
    done

    local tools=(bitlocker2john calc_stat cprepair dmg2john eapmd5tojohn genmkvpwd hccap2john
                 keepass2john mkvcalcproba putty2john racf2john raw2dyna SIPdump uaf2john
                 vncpcap2john wpapcap2john)
    for t in "${tools[@]}"; do
        [[ -x run/$t ]] && install -Dm755 run/$t -t "$pkgdir/usr/lib/john" \
                         && ln -sf "/usr/lib/john/$t" "$pkgdir/usr/bin/$t"
    done

    # main data
    mkdir -p "$pkgdir/usr/share/john"
    for f in run/*.conf run/*.chr run/*.lst run/dictionary* run/stats; do
        [[ -e $f ]] || continue
        install -Dm644 "$f" "$pkgdir/usr/share/john/${f##*/}"
    done

    # rules
    mkdir -p "$pkgdir/usr/share/john/rules"
    for f in run/rules/*; do
        [[ -e $f ]] || continue
        install -Dm644 "$f" "$pkgdir/usr/share/john/rules/${f##*/}"
    done

    # OpenCL
    [[ -d run/opencl ]] && install -d "$pkgdir/usr/share/john/opencl" && cp -a run/opencl/* "$pkgdir/usr/share/john/opencl" && chmod -R a+r "$pkgdir/usr/share/john/opencl"

    # docs & license
    install -d "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
    cp -a doc/* "$pkgdir/usr/share/doc/$pkgname" 2>/dev/null || true
    install -Dm644 doc/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    chmod -R a+r "$pkgdir/usr/share/doc/$pkgname"

    # shell completions
    install -Dm644 run/john.bash_completion "$pkgdir/usr/share/bash-completion/completions/john"
    install -Dm644 run/john.zsh_completion "$pkgdir/usr/share/zsh/site-functions/_john"
}
