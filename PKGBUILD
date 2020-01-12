# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

# You need to manually download the Easy2Boot_v1.B8 zip file from:
# https://www.fosshub.com/Easy2Boot.html?dwl=Easy2Boot_v1.B8.zip

pkgname='easy2boot'
pkgver='1.B8'
pkgrel='1'
pkgdesc='Highly-configurable USB drive multiboot software with support for Secure UEFI booting'
url='http://www.easy2boot.com/'
arch=('any')
license=('custom:easy2boot license')
depends=()
makedepends=('dos2unix')
source=(
  "local://Easy2Boot_v${pkgver}.zip"
)
sha256sums=('549092e92532c9dd420800b9ba4ca3ce58fb46bf03463b5c63c05a01db0e757c')

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
