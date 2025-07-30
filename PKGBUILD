# Maintainer: Bryan Perdrizat <perso@garage-c0.re>
# Contributor: Robert Pannick <rwpannick@gmail.com>
# Contributor: Nigel Michki <nigeil@yahoo.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Serhii Balbieko <sergey@balbeko.com>
# Contributor: Simon Dreher <code@simon-dreher.de>

_name=sonic-pi

pkgname=sonic-pi-git
pkgver=v5.1.0 # Because someone bumped the version to high ??
pkgrel=1
pkgdesc="The Live Coding Music Synth for Everyone"

arch=('i686' 'x86_64' 'x86_64_v3')
url="http://sonic-pi.net/"
license=('MIT')

groups=('pro-audio')

conflicts=('sonic-pi')
provides=('sonic-pi')

depends=('aubio' 'elixir' 'gcc-libs'
'glfw-x11' 'qscintilla-qt6' 'qt6-base' 'qt6-svg' 'qt6-tools'
'qt6-webengine' 'ruby' 'ruby-ffi' 'ruby-erb' 'ruby-racc' 'ruby-i18n' 'ruby-kramdown' 'ruby-minitest' 'ruby-mocha' 'ruby-multi_json'
'ruby-rugged' 'ruby-rexml' 'stk' 'libxext' 'libxft' 'libx11' 'opus-tools' 'opus'
'sc3-plugins' 'sox' 'supercollider')

makedepends=('boost' 'cmake' )

source=('git+https://github.com/samaaron/sonic-pi.git'
        "${_name}.sh")

sha512sums=('SKIP'
            'bb578996b305fbb07b95610caf1fc1a08c760a49cf3902f012ed49ee4404f7d8c10d66aded88e538b20c811b4bb21c4e17f47761863eebd2bff2792ec38a738d')

pkgver() {
  cd "${_name}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  gendesk -f -n \
          --pkgname "${pkgname}" \
          --pkgdesc "${pkgdesc}" \
          --name "${_name}" \
          --exec "${_name}" \
          --categories "AudioVideo;Audio"
}

build() {
  cd "${_name}/app"
  ./linux-build-all.sh
}

package() {
  cd "${_name}/app"

  ./linux-release.sh

  mkdir -p "${pkgdir}/opt/${_name}"

  cp -r build/linux_dist/* "${pkgdir}/opt/${_name}/"

  # xdg
  install -vDm 644 ../${_name}.desktop -t "${pkgdir}/usr/share/applications/"

  install -vDm 644 gui/images/icon-smaller.png "${pkgdir}/usr/share/icons/${_name}.png"

  # license
  install -vDm 644 ../LICENSE.md -t "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  install -vDm 755 ../../${_name}.sh "${pkgdir}/usr/local/bin/${_name}"

}
