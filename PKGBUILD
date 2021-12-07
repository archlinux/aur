#Maintainer: Dylan Delgado

pkgname=mlucas
pkgver=20.1.1
pkgrel=2
pkgdesc="Program used to perform Lucas-Lehmer tests of Mersenne numbers. Can be built on the ARM architecture."
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://www.mersenneforum.org/mayer/README.html"
depends=("gmp" "xz")
optdepends=("python: to use the primenet.py work management script")
license=('FDL1.3')
source=("https://www.mersenneforum.org/mayer/src/C/mlucas_v${pkgver}.txz")
md5sums=('970c4dde58417bd7f6be0e4af4b59b4e')

#prepare() {
#cd "${srcdir}"/"${pkgname}"_v"${pkgver}"
#Only patch if the kernel version is at least 5.5.0
#kermajver=`uname -r | cut -d. -f1`
#kerminver=`uname -r | cut -d. -f2`
#if [ $kermajver -gt 5 ]; then
   #patch -p1 < "../../sysctl-missing.patch"
#elif [ $kermajver -eq 5 ] && [ $kerminver -ge 5 ]; then
   #patch -p1 < "../../sysctl-missing.patch"
#fi
#}

build() {
cd "${srcdir}"/"${pkgname}"_v"${pkgver}"/src
#Check the instructions on the computer and build based on that
#use this for x86, x86_64
if [[ $CARCH == "i686" || $CARCH == "x86_64" ]]
then
    if grep avx512 /proc/cpuinfo > /dev/null;
    then
        #avx512 (Intel i9, KNL)
        gcc -g -c -O3 -DUSE_AVX512 -DUSE_THREADS -march=native *.c > build.log
    elif grep avx2 /proc/cpuinfo > /dev/null;
    then
        #avx2 (most modern Intel processors (Haswell+), AMD Ryzen)
        gcc -g -c -O3 -DUSE_AVX2 -mavx2 -DUSE_THREADS *.c > build.log
    elif grep avx /proc/cpuinfo > /dev/null;
    then
        #avx (Intel Sandy/Ivy Bridge, AMD Heavy-Equipment)
        gcc -g -c -O3 -DUSE_AVX -mavx -DUSE_THREADS *.c > build.log
    elif grep sse2 /proc/cpuinfo > /dev/null;
    then
        #sse2 (Most machines from ~2003 on should have this!)
        gcc -g -c -O3 -DUSE_SSE2 -DUSE_THREADS *.c > build.log
    else
        #generic x86, x86_64 build
        gcc -g -c -O3 -DUSE_THREADS *.c > build.log
    fi
fi

#arm
#only go to this if CARCH is arm or aarch64
if [[ $CARCH == "arm" || $CARCH == "aarch64" ]]
   then
   if grep asimd /proc/cpuinfo > /dev/null;
   then
      #newer arm chips
      gcc -g -c -O3 -DUSE_ARM_V8_SIMD -DUSE_THREADS *.c > build.log
   else
      #older arm chips
      gcc -g -c -O3 -DUSE_THREADS *.c > build.log
   fi
fi
#check the build log, to see if it empty, then link

if ! grep error build.log > /dev/null;
then
   gcc -g -o ../Mlucas *.o -lm -lpthread -lrt -lgmp
fi
}

package() {
cd "${srcdir}"/"${pkgname}"_v"${pkgver}"
install -Dm755 Mlucas "${pkgdir}"/usr/bin/mlucas
}
