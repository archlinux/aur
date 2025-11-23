# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Previous Maintainer: Clint Valentine <valentine.clint@gmail.com>
pkgname=snpeff
_pkgname=SnpEff
_pkg2=SnpSift
pkgver=5.3a
_pkgver2=5.1
pkgrel=1
pkgdesc="Genetic variant annotation and effect prediction toolbox. doi:10.4161/fly.19695"
arch=('any')
url="https://pcingola.github.io/SnpEff/"
provides=('SnpSift')
license=('MIT')
depends=('java-runtime>=12' 'python' 'perl' 'antlr4')
makedepends=('maven' 'java-environment>=12' 'git')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pcingola/SnpEff/archive/refs/tags/v$pkgver.tar.gz"
        "$_pkg2-${_pkgver2}.tar.gz::https://github.com/pcingola/SnpSift/archive/refs/tags/v${_pkgver2}.tar.gz"
        "https.patch::https://patch-diff.githubusercontent.com/raw/pcingola/SnpSift/pull/84.patch"
        "snpSift.sh"
        "snpEff.sh"
       )
sha512sums=('4d1fd8292006108444d54b0dd6f15919142180f9b4f8e28235afb4dfab42f6563f14738f6c1398f7071a72c6e60e3cbdb6dfb725380ba584cac040a99ae7f4d8'
            '074139695584227d3e523962b81ed1cd1687a146b973ec761e5c42fccf865b6f01bd8fc1280a1f73e7c9ab3292bfc3358d56a572f0795bd05fa879011a4ad950'
            'eb802167761ea7de0b7fdb60b0cc9440d40ea21fe6ed164dc900452e224d71039a8e187e1b7a6499b91338580378c33aa678a23b81f3e27f0f939a4cd3ef6a0c'
            '9819376173c372cec8ae3f28d1b3857a1b63690bf16213e6f26ebd5d29150616c8f8a3d0ecf8d9ba24c34e24f28ab56edecf8c9cee3c578ae673da7c65c48f0d'
            '0eb2339b55969cc065b8c15bee06d8728b0576689217777bf24e209409d61210f91e814bb1a5dddc651dd2a3f35d0f3911bd3161d6d3275604ea58cf83f9086a')
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
