# Maintainer: Erhan Karabulut <x9x@keemail.me>
# Based on the original john-git PKGBUILD by David Ryskalczyk

pkgname=john-bj-git
pkgver=1.9.0.r0.gc5b4c8e
pkgrel=1
pkgdesc="John the Ripper – bleeding-jumbo branch (yescrypt, OpenCL, MPI, CPU fall-backs)"
arch=('x86_64' 'aarch64' 'i686')
url="https://www.openwall.com/john/"
license=('GPL2' 'custom')

depends=('openssl' 'gmp' 'libpcap' 'openmpi' 'gcc-libs' 'opencl-icd-loader')
makedepends=('git' 'opencl-headers' 'nss' 'libxml2' 'libgsf' 'rpcsvc-proto')
optdepends=(
    'perl: helper scripts'
    'ruby: helper scripts'
    'python: helper scripts'
    'nss: mozilla2john'
    'libgsf: office2john'
    'libxml2: office2john'
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
            # generic (non-XOP) becomes default
            CFLAGS="${CFLAGS/-march=*}" ./configure "${common_opts[@]}"
            make clean && make
            mv -v ../run/john ../run/john-non-xop

            # AVX
            ./configure "${common_opts[@]}" CFLAGS="$CFLAGS -mavx"
            make clean && make
            mv -v ../run/john ../run/john-non-avx

            # XOP (optional, only for CPUs that support it)
            ./configure "${common_opts[@]}" CFLAGS="$CFLAGS -mxop"
            make clean && make
            mv -v ../run/john ../run/john-xop
            ;;
        i686)
            for flag in "" -mmmx -msse2 -mavx -mxop; do
                [[ $flag ]] && CFLAGS="$CFLAGS $flag"
                ./configure "${common_opts[@]}" CFLAGS="$CFLAGS"
                make clean && make
                [[ $flag ]] && mv -v ../run/john "../run/john-${flag#-}"
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

    # default binary: non-XOP version for all CPUs
    install -Dm755 run/john-non-xop -t "$pkgdir/usr/bin/john"

    # CPU fallback binaries
    for cpu in non-avx non-sse2 non-mmx xop; do
        [[ -e run/john-$cpu ]] && install -Dm755 run/john-$cpu -t "$pkgdir/usr/bin"
    done

    # symlinks for legacy tools
    for link in unshadow unafs unique undrop rar2john zip2john gpg2john base64conv; do
        rm -f "$pkgdir/usr/bin/$link"
        ln -s /usr/bin/john "$pkgdir/usr/bin/$link"
    done

    # helper scripts
    install -d "$pkgdir/usr/lib/john" "$pkgdir/usr/bin"
    install -m755 run/{*.py,*.pl,*.rb,*.lua,mailer,benchmark-unify} -t "$pkgdir/usr/lib/john" 2>/dev/null || true
    for ext in pl py rb lua; do
        for s in "$pkgdir"/usr/lib/john/*."$ext"; do
            [[ -e $s ]] && ln -s "/usr/lib/john/${s##*/}" "$pkgdir/usr/bin/${s##*/}"
        done
    done

    # *2john tools
    local tools=(bitlocker2john calc_stat cprepair dmg2john eapmd5tojohn genmkvpwd hccap2john
                 keepass2john mkvcalcproba putty2john racf2john raw2dyna SIPdump uaf2john
                 vncpcap2john wpapcap2john)
    for t in "${tools[@]}"; do
        [[ -x run/$t ]] && install -Dm755 run/$t -t "$pkgdir/usr/lib/john" \
                         && ln -s "/usr/lib/john/$t" "$pkgdir/usr/bin/$t"
    done

    # config & data files
    install -Dm644 run/john.conf -t "$pkgdir/etc/john"
    install -Dm644 run/john.conf -t "$pkgdir/usr/share/john/john.conf"
    install -Dm644 run/*.chr run/*.lst run/dictionary* run/stats -t "$pkgdir/usr/share/john"
    install -Dm644 run/rules/* -t "$pkgdir/usr/share/john/rules"

    # OpenCL kernels
    if [[ -d run/opencl ]]; then
        install -d "$pkgdir/usr/share/john/opencl"
        cp -a run/opencl/* "$pkgdir/usr/share/john/opencl"
        chmod -R a+r "$pkgdir/usr/share/john/opencl"
    fi

    # docs & license
    install -d "$pkgdir/usr/share/doc/john" "$pkgdir/usr/share/licenses/$pkgname"
    cp -a doc/* "$pkgdir/usr/share/doc/john"
    install -Dm644 doc/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    chmod -R a+r "$pkgdir/usr/share/doc/john"

    # shell completions
    install -Dm644 run/john.bash_completion "$pkgdir/usr/share/bash-completion/completions/john"
    install -Dm644 run/john.zsh_completion "$pkgdir/usr/share/zsh/site-functions/_john"
}
