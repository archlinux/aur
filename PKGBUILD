# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# TODO: Add more _printerids to make autodetect work for more models.
#   The printer ID is found inside the ()
#   Discovered Network Printers: B411 (OKI DATA CORP B411)

_printerids=(
  # PPDName:Friendly Name (MATCH TEXT)
  'OKB411:Oki B411 PCL (OKI DATA CORP B411)'
)

set -u
pkgname='oki-b411-b431'
pkgver='5.0.0'
pkgrel='1'
pkgdesc='CUPS printer driver for the Okidata B410 B411 B420 B431 B4100 B4200 B4250 B4300 B4350 B4400 B4500 B4550 B4600 MB460 MB470 MB480'
arch=('i686' 'x86_64')
url='https://www.okidata.com/'
license=('GPL')
depends=('cups')
makedepends=('gzip')
#_srcdir='MB400PCL'
#source=('ftp://ftp2.okidata.com/pub/drivers/linux/SFP/monochrome/desktop/MB400PCLv5.tar')
_srcdir='.'
source=('https://www.oki.com/printing/download/ok400pcl_oel.tar_30939.gz')
md5sums=('04a9201fe847c1ae37c1c27637425953')
sha256sums=('1131976fcb53975ddcf557e827114bd58cbf5beabfec31e454d12e539d7de81e')

prepare() {
  set -u
  cd "${_srcdir}"
  # Make the installer package compatible
  chmod 755 'install.sh'
  #cp -p 'install.sh' 'install.Arch.sh'
  sed -e '# Disable unnecessary PATH statements' \
      -e 's:^PATH=/:# &:g' \
      -e 's:^export PATH:# &:g' \
      -e '# Ownership is managed by makepkg' \
      -e 's:\${CHOWN}:# &:g' \
      -e 's:\${CHGRP}:true # &:g' \
      -e '# Root is not necessary when packaging' \
      -e 's:\[ `\${ID} -u`:[ -z "${DESTDIR}" ] \&\& &:g' \
      -e '# Disable these variables to ensure that set -u catches us if we try to use them.' \
      -e 's:^_CUPS[A-Z]*=":# &:g' \
      -e '# Install to package folder' \
      -e 's:_PATH="/usr/:_PATH="${DESTDIR}/usr/:g' \
      -e '# Terminate before changing services' \
      -e 's:^\(for i in \${_CUPS}\):if [ "${DESTDIR}" != "" ]; then\n\texit 0\nfi\n\n\1:g' \
    -i 'install.sh'
  test ! -s 'install.Arch.sh'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -d "${pkgdir}/usr/share/cups/model"
  install -d "${pkgdir}/usr/lib/cups/filter"
  DESTDIR="${pkgdir}" \
  sh -u -e 'install.sh'
  # Add alternate nicknames to make model autodetect work
  local _oldfile=(??'400'???'.ppd.gz')
  _oldfile="${_oldfile[0]}"
  local _printerid
  for _printerid in "${_printerids[@]}"; do
    local _newtag="${_printerid%%:*}"
    local _newid="${_printerid#*:}"
    local _newfile="${_oldfile//${_oldfile: 0:5}/${_newtag}}"
    test "${_oldfile}" != "${_newfile}" || echo "${}"
    gunzip < "${_oldfile}" | \
    sed -e '# Fix autodetect *NickName' \
        -e "s:OKI B4000 / B400 / MB400 PCL:${_newid}:g" \
        -e "s:OK400PCL.PPD:${_newfile%\.gz}:g" \
      | gzip > "${_newfile}"
    install -m644 "${_newfile}" -t "${pkgdir}/usr/share/cups/model/"
  done

  set +u
}
set +u
