# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

set -u
pkgname='zoiper'
pkgver='5.2.25'
pkgrel='1'
pkgdesc='a SIP and IAX2 VoIP softphone'
arch=('i686' 'x86_64')
url='http://www.zoiper.com/'
license=('custom')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'v4l-utils')
options=('!strip')
source=('LICENSE' "${pkgname}.desktop" "${pkgname}.png" "${pkgname}-24.png" "${pkgname}-48.png" "${pkgname}-96.png")
source+=('zoipdl.sh')
_srcfile="${pkgname}${pkgver%%.*}_${pkgver}_${CARCH:-}.tar.xz"
sha1sums=('645d0003fe2e0975c53e008aa31106cceb0d8dad'
          'ec8e948442bd0d010004420f7338ccfb08985007'
          'c1eea005beb7587b24b0a0d242eebc49a67f9026'
          '1a0f4c83c6b538584865df327702f800689493b0'
          '7fef1f81c32fc4be2d876fadf34178f60ea0a29e'
          '11fb63a8353353d28288a644aeb4cdf9a3ab3e8c'
          'e3235992f6367a598a97fe288ae663035ac18b16')
sha256sums=('4ed406e6786163514ff0714af7417e680c56cbe1edcb297196d6dbee2ffa798b'
            '8d449a3f15d0a1f6307106bcb5f62ec8f921ba2279d5d42042bd0d2beb08f103'
            'b3dd0f8bb4314444177b122d032142459cba606b8f7812a8489d3cbbf83f2b3b'
            '79bac289dba2ed8bc65886643ba6aaf1a5057ed1ff5605a0eac166d7f4afd0b8'
            '5a795b8248a576a7166e7f4d773f83a41a640d698917a35eb8bfa7eef7c4bfcc'
            '619466b96c560fbd2511c04120810f0cb30a58aa12d5bcca2af977bcd527fb41'
            '566a2008a28df0d1ceeff4b935490b9a9ce7bd959b4c21df27daa9adcbb999a0')
PKGEXT='.pkg.tar.gz'

if ! :; then
  source+=("${_srcfile}::https://zoipdl.tgz")
  # DLAGENTS requires an executable file and cannot call PKGBUILD functions
  #DLAGENTS=("https::${startdir}/zoipdl.sh %o %u") # does not work with spaces in folder names, printf %q doesn't work any better
  DLAGENTS=("https::./zoipdl.sh %o %u") # will a relative path work for every AUR helper?
  noextract=("${_srcfile}")
fi

# Should be in prepare() but pacaur suppresses the message text from prepare() and does not halt on prepare() failure.
build() {
  set -u
  if ! test -e "${startdir}/${_srcfile}"; then
    set +u
    local _url='https://www.zoiper.com/en/voip-softphone/download/zoiper5/for/linux'
    warning "There is no longer a direct download link for the Zoiper tarball."
    warning "Get it manually from: ${_url}"
    warning "Or use the supplied ${startdir}/zoipdl.sh"
    false
  fi
  set +u
}

package() {
  set -u
  install -d "${pkgdir}/usr/lib"
  pushd "${pkgdir}/usr/lib" > /dev/null
  set +u; msg2 "Unpack ${_srcfile}"; set -u
  bsdtar -xf "${startdir}/${_srcfile}"
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
