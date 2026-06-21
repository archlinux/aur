# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Previous Maintainer: Clint Valentine <valentine.clint@gmail.com>
pkgname=snpeff
_pkgname=SnpEff
_pkg2=SnpSift
pkgver=5.4c
_pkgver2=5.4b
pkgrel=3
pkgdesc="Genetic variant annotation and effect prediction toolbox. doi:10.4161/fly.19695"
arch=('any')
url="https://pcingola.github.io/SnpEff/"
provides=('SnpSift')
license=('MIT')
depends=('java-runtime>=21' 'python' 'perl' 'antlr4')
makedepends=('maven' 'java-environment>=21' 'git')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pcingola/SnpEff/archive/refs/tags/v$pkgver.tar.gz"
        "$_pkg2-${_pkgver2}.tar.gz::https://github.com/pcingola/SnpSift/archive/refs/tags/v${_pkgver2}.tar.gz"
        "https.patch::https://patch-diff.githubusercontent.com/raw/pcingola/SnpSift/pull/84.patch"
        "snpSift.sh"
        "snpEff.sh"
       )
sha512sums=('01b2958af4e48da7939b33b6936dd2339461c0452a5a68abe09b45f33452910bd812b0274db4d2dc0057f32d6e441b72d2d6bf0817af2131091099c94d72695b'
            '93edac1813220045330d571576f17554d31323db59af8fc23012f18cd015be20c533014e4cb9748b5349ab0941db58443c6730164dd4b35eb5602fbd9168daa6'
            'eb802167761ea7de0b7fdb60b0cc9440d40ea21fe6ed164dc900452e224d71039a8e187e1b7a6499b91338580378c33aa678a23b81f3e27f0f939a4cd3ef6a0c'
            'a4efd1aa0418ed5b156b5f85c6299bd3d3e2422364446ee5cb58d827f60512b7bfc8c44b23add54795ccd093c104574cd210c552a5c978c8d11195f38ad29d43'
            '53304f77ba01ad45008ca0b86f84e9797093abc09e0b72689bbb14c0b876aac77be19ffe2a968ce9958d776c1aa29aa056d1faba04609f9a53dfca7b26b00884')
prepare() {

    cd "${srcdir}/$_pkgname-$pkgver"
    # add correct version in pom.xml of SnpEff
        sed -i "6s/\(<version>\).*\(<\/version>\)/\1${pkgver}\2/g" pom.xml
    # fix pom.xml of SnpSift
        cd "${srcdir}/$_pkg2-${_pkgver2}"
        ## fix http sources for dependencies
        patch -p1 < ${srcdir}/https.patch
        ## add correct version
        sed -i "6s/\(<version>\).*\(<\/version>\)/\1${_pkgver2}\2/g" pom.xml
        ## set correct snpeff version as dependency
        export snpver=$(sed -n '41p' pom.xml | cut -d '>' -f 2 | cut -d '<' -f 1)
        sed -i "41s/${snpver}/[${pkgver},)/g" pom.xml
}

build() {
    # Find a suitable Java compiler (requires JDK >= 21)
    local java_home=""
    if [ -x /usr/bin/javac ]; then
        local default_ver=$(javac -version 2>&1 | cut -d' ' -f2 | cut -d. -f1)
        if [ -n "$default_ver" ] && [ "$default_ver" -ge 21 ]; then
            java_home="/usr/lib/jvm/default"
        fi
    fi

    if [ -z "$java_home" ]; then
        for jvm in /usr/lib/jvm/java-*-openjdk /usr/lib/jvm/java-*; do
            if [ -x "$jvm/bin/javac" ]; then
                local jvm_ver=$(basename "$jvm" | sed -E 's/java-([0-9]+)-.*/\1/')
                case "$jvm_ver" in
                    [0-9]*)
                        if [ "$jvm_ver" -ge 21 ]; then
                            java_home="$jvm"
                            break
                        fi
                        ;;
                esac
            fi
        done
    fi

    if [ -z "$java_home" ]; then
        echo "No Java Development Kit (JDK) >= 21 found to build this package." >&2
        return 1
    fi

    echo "Using JDK: $java_home"
    export JAVA_HOME="$java_home"
    export PATH="$JAVA_HOME/bin:$PATH"

	# Build SnpEff
    cd "${srcdir}/$_pkgname-$pkgver"
    mvn -e clean compile assembly:single jar:jar
    
    # Install SnpEff.jar file in local Maven repo as dependency for building SnpSift
    mvn install:install-file \
	 -Dfile=target/SnpEff-${pkgver}.jar \
	 -DgroupId=org.snpeff \
	 -DartifactId=SnpEff \
	 -Dversion=$pkgver \
	 -Dpackaging=jar \
	 -DgeneratePom=true \
	 --quiet

    # Build SnpSift
    cd "${srcdir}/$_pkg2-${_pkgver2}"
    mvn -e clean compile assembly:single jar:jar
    
}

package() {
    install -Dm644 ${srcdir}/$_pkgname-$pkgver/target/SnpEff-${pkgver}-jar-with-dependencies.jar  "${pkgdir}"/usr/share/java/snpEff/snpEff.jar
    install -Dm644 ${srcdir}/$_pkg2-${_pkgver2}/target/SnpSift-${_pkgver2}-jar-with-dependencies.jar  "${pkgdir}"/usr/share/java/snpEff/snpSift.jar
    install -Dm644 ${srcdir}/$_pkgname-$pkgver/config/snpEff.config "${pkgdir}"/usr/share/java/snpEff/snpEff.config
    install -Dm644 ${srcdir}/$_pkgname-$pkgver/LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 snpEff.sh "${pkgdir}"/usr/bin/snpeff
    install -Dm755 snpSift.sh "${pkgdir}"/usr/bin/snpsift
}
