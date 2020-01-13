# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

# You need to manually download the Easy2Boot_v1.B8 zip file from:
# https://www.fosshub.com/Easy2Boot.html?dwl=Easy2Boot_v1.B8.zip

_grub4dos_version=0.4.5
pkgname='easy2boot'
pkgver='1.B8'
pkgrel='2'
pkgdesc='Highly-configurable USB drive multiboot software with support for Secure UEFI booting'
url='http://www.easy2boot.com/'
arch=('any')
license=('custom:easy2boot license')
depends=()
makedepends=('dos2unix' 'unrar')
source=(
  "local://Easy2Boot_v${pkgver}.zip"
  "grub4dos.rar::http://dl.grub4dos.chenall.net/grub4dos-${_grub4dos_version}-2009-12-23.rar"
)
noextract=('grub4dos.rar')
sha256sums=('549092e92532c9dd420800b9ba4ca3ce58fb46bf03463b5c63c05a01db0e757c'
            '94a256b0dd022f71ab1ca866f00621e0402313f2944f9af6955bc787ee611ea5')

prepare() {
  # Use newer, working bootlace
  unrar e grub4dos.rar grub4dos-${_grub4dos_version}/bootlace.com
  mv bootlace.com _ISO/docs/linux_utils/bootlace.com
  rm grub4dos.rar
}

package() {
  rm "Easy2Boot_v${pkgver}.zip"

  execs=(
    'add-32-bit-support.sh'
    'bootlace.com'
    'bootlace64.com'
    'defragfs'
    'defragfs.pl'
    'fmt.sh'
    'fmt_ntfs.sh'
    'udefrag'
  )

  mkdir -p "${pkgdir}/usr/bin"

  dir="${pkgdir}/opt/easy2boot"
  mkdir -p "$dir"
  cp -r . "$dir"
  for f in "${execs[@]}"; do
    d="_ISO/docs/linux_utils/$f"
    dos2unix "${dir}/$d"
    chmod +x "${dir}/$d"
    _make_wrapper "/opt/easy2boot/$d" "${pkgdir}/usr/bin/e2b-$f"
  done

  install -Dpm644 "_ISO/docs/Licences/E2B_LICENCE.txt" -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_make_wrapper() {
	cat > "$2" <<END
#!/bin/bash
exec "$1" "\$@"
END
	chmod +x "$2"
}
