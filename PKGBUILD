# Maintainer: bilabila <bilabila@qq.com>
_pkgname=matconvnet
_pkgver=1.0-beta25
_patch=R2019a.patch
pkgname=$_pkgname-cudnn
pkgver=1.0.25
pkgrel=4
pkgdesc='matconvnet compile with cuda and cudnn'
arch=(x86_64)
url=http://www.vlfeat.org/matconvnet/
provides=($_pkgname)
conflicts=($_pkgname)
license=(custom)
depends=(cudnn gcc)
makedepends=(make)
source=(http://www.vlfeat.org/matconvnet/download/$_pkgname-$_pkgver.tar.gz
$_patch)
sha512sums=(0ac36308067598ac62a1f0ec529fa5ba7758bb8b3588a88e12de70d1e62c50059e573b2e5936864527a1a1a815299feaf0c95cdc3ef3ec8160aa4bfdbbf534f5
44709595bcfb607f229725510d08e1975c9ff62eab822085e4f3d2af05d96823abcc7567e810ad6225143fa02331885e706d72911303dc7eaabbfe1ad9b1b939)
install=$pkgname.install
prepare(){
    cd $_pkgname-$_pkgver
    patch -Nlp1 -i ../$_patch
}
build() {
    # find MATLABROOT
    d=/usr/local/MATLAB/
    [[ ! -d "$d" ]] && d=$HOME/bin/MATLAB || :
    [[ ! -d "$d" ]] && d=$HOME/bin/matlab || :
    [[ ! -d "$d" ]] && d=$HOME/MATLAB || :
    [[ ! -d "$d" ]] && d=$HOME/matlab || :
    [[ ! -d "$d" ]] && d="$(readlink -f "$(which -a matlab 2>/dev/null|tail -1)" | rev | cut -d'/' -f3- | rev)" || :
    [[ ! -d "$d" ]] && { echo -e "\nerror: can't find MATLAB ROOT DIR\n";return 1; } || :
    f="$(ls "$d"|grep '^R[0-9]\{4\}\(a\|b\)$'|sort -r|head -1)"
    f="$d"/"$f"/bin/matlab
    [[ ! -d "$d" || ! -f "$f" ]] && { echo -e "\nerror: can't find MATLAB ROOT DIR\n";return 1; } || :
    # check mwgpu
    f="$d"/bin/glnxa64/libmwgpu.so
    [[ ! -f "$f" ]] && { echo -e "\nerror: can't find "$f", please install 'parallel computing toolbox' add-on\n"; return 1; } || :
    echo -e "\n\tMATLABROOT="$d"\n"
    # make
    cd $_pkgname-$_pkgver
    make ENABLE_GPU=yes CUDAROOT=/opt/cuda MATLABROOT="$d" cudaMethod=nvcc ENABLE_CUDNN=yes CUDNNROOT=/usr
}
package() {
    d="$pkgdir"/usr/share
    install -Dm644 $_pkgname-$_pkgver/COPYING "$d"/licenses/$_pkgname/LICENSE
    d="$d"/$_pkgname
    cp -rT $_pkgname-$_pkgver "$d"
    find "$d" -type d -exec chmod 755 {} +
    find "$d" -type f -exec chmod 644 {} +
}
