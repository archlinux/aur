# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

set -u
pkgname='zoiper'
pkgver='5.4.10'
pkgrel='1'
pkgdesc='a SIP and IAX2 VoIP softphone'
arch=('i686' 'x86_64')
url='https://www.zoiper.com/'
license=('custom')
depends=('gtk2' 'libnotify' 'libxss' 'v4l-utils')
options=('!strip')
_srcfil="${pkgname}${pkgver%%.*}_${pkgver}_${CARCH:-}.tar.xz"
source=(
  "manual://${_srcfil}"
  'LICENSE' "${pkgname}.desktop" "${pkgname}.png" "${pkgname}-24.png" "${pkgname}-48.png" "${pkgname}-96.png"
)
source+=('zoipdl.sh' 'readme.sh')
noextract=("${_srcfil}")
md5sums=('5a492ecd10812e936701a11b45dc16cd'
         'af44d50f7be21acccbb3f70e831b57b9'
         '1c77ec64b25899d3b027153da9a0a598'
         'c11462ef768e78964c9771ef8ba9490f'
         'd2a00d37c81be11e43c273b5b18e1c09'
         'a2b638b39dd25ae029ec80ade53cd48b'
         'b03e6d65d8b5e22566c20b9a34eb5b95'
         '5b8ff14d5b35553775f43db264630109'
         'fd42ad359f60c60d757e3e162c291879')
sha256sums=('dbb9de21881ab689ad79be2030288b49afda1937ea2b1b03f0fdef312ccc1465'
            '4ed406e6786163514ff0714af7417e680c56cbe1edcb297196d6dbee2ffa798b'
            '8d449a3f15d0a1f6307106bcb5f62ec8f921ba2279d5d42042bd0d2beb08f103'
            'b3dd0f8bb4314444177b122d032142459cba606b8f7812a8489d3cbbf83f2b3b'
            '79bac289dba2ed8bc65886643ba6aaf1a5057ed1ff5605a0eac166d7f4afd0b8'
            '5a795b8248a576a7166e7f4d773f83a41a640d698917a35eb8bfa7eef7c4bfcc'
            '619466b96c560fbd2511c04120810f0cb30a58aa12d5bcca2af977bcd527fb41'
            '9081235eda1c4020b578b43414071ee64a50552bcd7ac16acd0507899e5a90e2'
            '112b1528f30537e4374f94af822c61f382269a5b6e6bd55dc5df1ee9bfe38ea9')
PKGEXT='.pkg.tar.gz'

# from oracle-sqldeveloper
_url='https://www.zoiper.com/en/voip-softphone/download/zoiper5/for/linux'
DLAGENTS+=("manual::./readme.sh ${_url} %o %u")
if [ -s ~/"Downloads/${_srcfil}" ] && [ ! -e "${_srcfil}" ]; then
  if type msg > /dev/null 2>&1; then
    set +u
    msg "Scooping files from ~/Downloads"
    msg2 "${_srcfil}"
    set -u
    ln -sr ~/"Downloads/${_srcfil}"
  fi
fi
if ! :; then
  source[0]="${_srcfil}::zoipdl://zoipdl.tgz"
  # DLAGENTS requires an executable file and cannot call PKGBUILD functions
  #DLAGENTS=("zoipdl::${startdir}/zoipdl.sh %o %u") # does not work with spaces in folder names, printf %q doesn't work any better
  DLAGENTS+=("zoipdl::./zoipdl.sh %o %u") # will a relative path work for every AUR helper?
fi

package() {
  set -u
  install -d "${pkgdir}/usr/lib"
  pushd "${pkgdir}/usr/lib" > /dev/null
  set +u; msg2 "Unpack ${_srcfil}"; set -u
  bsdtar --no-same-owner -xf "${startdir}/${_srcfil}"
  mv "Zoiper${pkgver%%.*}" "${pkgname}"
  pushd "${pkgname}" > /dev/null
  chmod 755 "${pkgname}"
  chmod 644 *.pak */*.pak *.bin *.dat
  popd > /dev/null
  popd > /dev/null
  install -d "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dpm644 "${pkgname}.png" "${pkgname}-24.png" "${pkgname}-48.png" "${pkgname}-96.png" -t "${pkgdir}/usr/share/pixmaps/"
  install -Dpm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}

set +u
