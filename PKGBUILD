# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

# You need to manually download the Easy2Boot_v1.B8 zip file from:
# https://www.fosshub.com/Easy2Boot.html?dwl=Easy2Boot_v1.B8.zip

_grub4dos_version=0.4.5
pkgname='easy2boot'
pkgver='2.10'
pkgrel='1'
pkgdesc='Highly-configurable USB drive multiboot software with support for Secure UEFI booting'
url='http://www.easy2boot.com/'
arch=('any')
license=('custom:easy2boot license')
depends=()
makedepends=('dos2unix' 'jq')
_projectName='Easy2Boot'
_fileName="${_projectName}_v${pkgver}_password_is_e2b.zip"
source=(
  "fosshub.html::https://www.fosshub.com/Easy2Boot.html/${_fileName}"
  # "grub4dos.rar::http://dl.grub4dos.chenall.net/grub4dos-${_grub4dos_version}-2009-12-23.rar"
)
noextract=('fosshub.html')
md5sums=('SKIP')

prepare() {

  json=$(cat fosshub.html | sed -n 's/.*var.*settings.*=//p' | jq)

  projectId=$(echo ${json} | jq '{projectId: .projectId}')

  tempJson=$(echo ${json} | jq --arg _fileName ${_fileName} '.pool.f[] | select(.n==$_fileName) | {fileName: .n, releaseId: .r}')

  echo ${tempJson}

  postData=$(echo ${projectId} ${tempJson} '{"projectUri": "${_projectName}.html","source":"CF"}' | jq -s 'add')

  echo $postData | jq

  _url=$(wget -O- --post-data="${postData}" --header='Content-Type:application/json' https://api.fosshub.com/download/ | jq '.data.url' | sed -e 's/^"//' -e 's/"$//')

  # _url=${_url:}

  # echo $_url
  wget -O ${_fileName} $_url

  bsdtar -x --passphrase e2b -f ${_fileName}

  # Use newer, working bootlace
  # unrar e grub4dos.rar grub4dos-${_grub4dos_version}/bootlace.com
  # mv bootlace.com _ISO/docs/linux_utils/bootlace.com
  # rm grub4dos.rar
}

package() {
  rm "${_fileName}"
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

