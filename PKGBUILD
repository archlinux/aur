# Maintainer Seva Alekseyev <sevaa@yarxi.ru>
# Maintainer Stoyan Minaev <stoyan.minaev@gmail.com>

pkgbase=amdfand-bin
pkgname=amdfand-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="AMDGPU Fan control service"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
_source=(
  "https://github.com/Eraden/amdgpud/releases/download/${pkgver}/amdfand"
  "https://raw.githubusercontent.com/Eraden/amdgpud/main/amdfand.service"
)
arch=('x86_64')
_md5sums=(
    '40faa72356d0df3d03553340fc0fc36e'
    '65cb5fbf83422943ab421e36ebd96345'
)
depends=(
)
keywords=(
  'amdgpu'
  'controller'
  'fan'
)

prepare() {
    cd $srcdir/
    echo "Due to 'makepkg' and 'PKGBUILD' specs limitations I need to dowanload sources and validate them by myself"
    for source_url in ${_source[@]}; do
        source_filename=${source_url##*/}
        if [ ! -f "$source_filename" ]; then
            echo "Downloading next source - $source_filename ..."
            curl -A DUMMY -O "$source_url";
        else
            echo "Found already downloaded source - $source_filename"
        fi
    done
    echo "And now we must validated dowanloaded sources ..."
    for (( i=0; i<${#_source[@]}; ++i )); do
        source_url=${_source[i]}
        source_filename=${source_url##*/}
        source_expected_md5sum=${_md5sums[i]}
        source_actual_md5sum=$(md5sum $source_filename | awk '{print $1}')
        if [ "$source_actual_md5sum" == "$source_expected_md5sum" ]; then
            echo "Validated next source - $source_filename"
        else
            echo "Found corrupted source - $source_filename"; return 1
        fi
    done    
}

build() {
    cd $srcdir/
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install -m 0755 $srcdir/amdfand $pkgdir/usr/bin
    install -m 0755 $srcdir/amdfand.service "$pkgdir/usr/lib/systemd/system/amdfand.service"
}

#vim: syntax=sh
