# Maintainer: François Garillot <francois[@]garillot.net>

pkgname=libnd4j-git
pkgver=20171010
pkgrel=1
pkgdesc="LibND4J is a C++ library for exposing accelerated arrays to Java"
license=('GPL')
url='https://github.com/deeplearning4j/libnd4j'
arch=('i686' 'x86_64')
provides=('libnd4j')
conflicts=('')
depends=('cmake>=3.2' 'gcc>=5.0')
optdepends=('cuda>=8.0: cuda support')
makedepends=('git' 'python' 'python-beautifulsoup4' 'python-urllib3')
options=()
source=(${pkgname%-git}::git+https://github.com/deeplearning4j/libnd4j.git)
md5sums=('SKIP')


build() {
        # Avoid '-fno-plt'
        export CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong"
        cd ${pkgname%-git}
        ./buildnativeoperations.sh -a native
        if (ldconfig -p | grep -q libcuda\.so); then
          COMPUTE=""
          if (nvidia-smi); then
            GPU=$(nvidia-smi --query-gpu=gpu_name --format=csv,noheader)
            COMPUTE=$(python get_ccompute.py $GPU)
            COMPUTE=$(echo $COMPUTE| tr -d '.')
          fi
          ./buildnativeoperations.sh -c cuda -cc $COMPUTE
        fi
}

package() {
        cd ${pkgname%-git}
        install -dm755 "$pkgdir/usr/lib"
        install -Dm755 "blasbuild/cpu/blas/libnd4jcpu.so" "$pkgdir/usr/lib"
        if (ldconfig -p | grep -q libcuda\.so); then
          install -Dm755 "blasbuild/cuda/blas/libnd4jcuda.so" "$pkgdir/usr/lib"
        fi
}
