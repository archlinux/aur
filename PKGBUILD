# Maintainer: François Garillot <francois[@]garillot.net>

pkgname=libnd4j-git
pkgver=20171010
pkgrel=5
pkgdesc="LibND4J is a C++ library for exposing accelerated arrays to Java"
license=('APACHE')
url='https://github.com/deeplearning4j/libnd4j'
arch=('i686' 'x86_64')
provides=('libnd4j')
conflicts=('libnd4j')
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
        nice ./buildnativeoperations.sh -a native
        if (ldconfig -p | grep -q libcuda\.so); then
          COMPUTE=""
          if (nvidia-smi); then
            GPU=$(nvidia-smi --query-gpu=gpu_name --format=csv,noheader)
            COMPUTE=$(python get_ccompute.py $GPU)
            COMPUTE=$(echo $COMPUTE| tr -d '.')
          fi
          nice ./buildnativeoperations.sh -c cuda -cc $COMPUTE
        fi
}

package() {
        cd ${pkgname%-git}
        install -dm755 "$pkgdir/usr/lib/libnd4j/blas"
        for file in blas/*.h;do
          install -m 644 "$file" "$pkgdir/usr/lib/libnd4j/blas/"
        done
        install -dm755 "$pkgdir/usr/lib/libnd4j/blasbuild/cpu/blas/"
        install -dm755 "$pkgdir/usr/lib/libnd4j/blasbuild/cuda/blas/"
        install -Dm644 "blasbuild/cpu/blas/libnd4jcpu.so" "$pkgdir/usr/lib/libnd4j/blasbuild/cpu/blas/"
        if (ldconfig -p | grep -q libcuda\.so); then
          install -Dm644 "blasbuild/cuda/blas/libnd4jcuda.so" "$pkgdir/usr/lib/libnd4j/blasbuild/cuda/blas/"
        fi
        echo '#!/bin/sh' > libnd4j.sh
        echo 'LIBND4J_HOME=/usr/lib/libnd4j' >> libnd4j.sh
        echo 'export LIBND4J_HOME' >> libnd4j.sh
        install -Dm 755 libnd4j.sh $pkgdir/etc/profile.d/libnd4j.sh
}
