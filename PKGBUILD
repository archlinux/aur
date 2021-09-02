# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

# You need to manually download the Easy2Boot_v1.B8 zip file from:
# https://www.fosshub.com/Easy2Boot.html?dwl=Easy2Boot_v1.B8.zip

_grub4dos_version=0.4.5
pkgname='easy2boot'
pkgver='2.09'
pkgrel='1'
pkgdesc='Highly-configurable USB drive multiboot software with support for Secure UEFI booting'
url='http://www.easy2boot.com/'
arch=('any')
license=('custom:easy2boot license')
depends=()
makedepends=('dos2unix' 'unrar')
source=(
  "fosshub.html::https://www.fosshub.com/Easy2Boot.html/Easy2Boot_v2.09_password_is_e2b.zip"
  # "grub4dos.rar::http://dl.grub4dos.chenall.net/grub4dos-${_grub4dos_version}-2009-12-23.rar"
)
noextract=('grub4dos.rar', 'Easy2Boot_v2.09_password_is_e2b.zip', 'fosshub.html')


prepare() {

  json=$(cat fosshub.html | sed -n 's/.*var.*settings.*=//p' | jq)
  projectId=$(echo $json | jq '{projectId: .projectId}')
  tempJson=$(echo $json | jq '.pool.f[] | select(.n=="Easy2Boot_v2.09_password_is_e2b.zip") | {fileName: .n, releaseId: .r}')
  postData=$(echo $projectId $tempJson '{"projectUri": "Easy2Boot.html","source":"CF"}' | jq -s 'add')

  # echo $postData | jq

  _url=$(wget -O- --post-data="${postData}" --header='Content-Type:application/json' https://api.fosshub.com/download/ | jq '.data.url' | sed -e 's/^"//' -e 's/"$//')

  # _url=${_url:}

  # echo $_url
  wget -O Easy2Boot_v2.09_password_is_e2b.zip $_url

  bsdtar -x --passphrase e2b -f Easy2Boot_v2.09_password_is_e2b.zip

  # Use newer, working bootlace
  # unrar e grub4dos.rar grub4dos-${_grub4dos_version}/bootlace.com
  # mv bootlace.com _ISO/docs/linux_utils/bootlace.com
  # rm grub4dos.rar
}

package() {
  rm "Easy2Boot_v${pkgver}_password_is_e2b.zip"
  rm "fosshub.html"

  execs=(
    'add-32-bit-support.sh'
    'bootlace.com'
    'bootlace64.com'
    'CreatePersistenceFile.sh'
    'defragfs'
    'defragfs.pl'
    'fmt.sh'
    'fmt_ntfs.sh'
    'grldr.mbr'
    'ReadMe_fmt.sh.txt'
    'runfmt.sh'
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
    _make_wrapper "/opt/easy2boot/$d" "${pkgdir}/usr/bin/$f"
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
md5sums=('f67be2fd311e92682574e1d28f22bbce')
