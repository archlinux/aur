# Maintainer: François Garillot <francois[@]garillot.net>

pkgname=nd4j-git
pkgver=20171011
pkgrel=1
pkgdesc="ND4J is a Java library for accelerated linear algebra on n-dimensional Java arrays"
license=('Apache 2.0')
url='https://github.com/deeplearning4j/nd4j'
arch=('i686' 'x86_64')
provides=('nd4j')
conflicts=('nd4j')
depends=('libnd4j-git' 'java-environment>=6.0' 'java-environment<9' 'maven>=3.3')
optdepends=('cuda>=8.0: cuda support')
makedepends=('git')
options=()
source=(${pkgname%-git}::git+https://github.com/deeplearning4j/nd4j.git)
md5sums=('SKIP')

build() {
        cd ${pkgname%-git}
        # set LIBND4J_HOME
        source /etc/profile.d/libnd4j.sh
        if (false && [ -f $LIBND4J_HOME/blasbuild/cuda/blas/libnd4jcuda\.so ]); then
            _nd4jopts="-DskipTests=true -Pcuda"
        else
            _nd4jopts="-DskipTests=true -Pnative -pl !nd4j-backends/nd4j-backend-impls/nd4j-cuda,!nd4j-backends/nd4j-backend-impls/nd4j-cuda-platform,!nd4j-backends/nd4j-tests"
        fi
        export LIBND4J_HOME=$LIBND4J_HOME
        mvn -e -X -q clean package -Puberjar $_nd4jopts
}


package() {
        cd ${pkgname%-git}
        install -dm755 "$pkgdir/usr/share/java/${pkgname%-git}"
        for file in nd4j-uberjar/target/nd4j-uberjar*; do
          install -Dm755 "$file" "$pkgdir/usr/share/java/${pkgname%-git}/"
        done
}
