# Maintainer: Robert Pannick <rwpannick@gmail.com>
# Maintainer: Nigel Michki <nigeil@yahoo.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Serhii Balbieko <sergey@balbeko.com>
# Contributor: Simon Dreher <code@simon-dreher.de>

_name=sonic-pi
pkgname=sonic-pi-git
pkgver=v4.3.0.r133.g94f25354c
pkgrel=1
pkgdesc="The Live Coding Music Synth for Everyone"
arch=('i686' 'x86_64')
url="http://sonic-pi.net/"
license=('MIT')
groups=('pro-audio')
conflicts=('sonic-pi')
provides=('sonic-pi')
depends=('aubio' 'boost' 'cmake' 'elixir' 'erlang-nox' 'gcc-libs' 'gendesk'
'glfw-x11' 'glibc' 'lua' 'osmid' 'qscintilla-qt6' 'qt6-base' 'qt6-svg' 'qt6-tools'
'qt6-webengine' 'rtaudio' 'rtmidi' 'ruby' 'ruby-activesupport' 'ruby-bundler'
'ruby-ffi' 'ruby-i18n' 'ruby-kramdown' 'ruby-minitest' 'ruby-mocha' 'ruby-multi_json'
'ruby-rake' 'ruby-rouge' 'ruby-rugged' 'ruby-sys-proctable' 'ruby-rexml' 'stk' 'libxext' 'libxft' 'libx11'
'sc3-plugins' 'sox' 'supercollider')
makedepends=('boost' 'curl' 'ninja' 'cmake' 'git' 'erlang-nox' 'gendesk' 'lua' 'qt5-tools' 'wkhtmltopdf-static' 'zip' 'unzip' 'tar')
source=('git+https://github.com/samaaron/sonic-pi.git'
        "${_name}-4.3.0-rugged_compile_flags.patch"
        "${_name}-4.3.0-find_package_glew.patch"
        "${_name}.sh")
sha512sums=('SKIP'
            'f7b0d2d747f41f78fd3015190edd49346f57bea9a2886ea29a181d5b9171ad80e45d129649046dee61a8f65e52665a9d5d0f77f330b8de5a3eb9d0ee2090431b'
            '366264f371b7779bbbd1231dabc7bda2c7492b56513168c1a08439c63ce990c9540013f505a0e519cde4061e0ba788e0c7c40208e7947589d673e48be027f239'
            'bb578996b305fbb07b95610caf1fc1a08c760a49cf3902f012ed49ee4404f7d8c10d66aded88e538b20c811b4bb21c4e17f47761863eebd2bff2792ec38a738d')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  gendesk -n \
          --pkgname "${pkgname}" \
          --pkgdesc "${pkgdesc}" \
          --name "${_name}" \
          --exec "${_name}" \
          --categories "AudioVideo;Audio"

  patch -Np1 -i "../${_name}-4.3.0-rugged_compile_flags.patch"

  patch -Np1 -i "../${_name}-4.3.0-find_package_glew.patch"

}

build() {
  cd "${_name}/app"
  ./linux-prebuild.sh -n
  ./linux-config.sh -n -c Release
  ./linux-build-gui.sh -n -c Release
  ./linux-post-tau-prod-release.sh -n -c Release
}

## tests fail: https://github.com/samaaron/sonic-pi/issues/1865
#check() {
#  cd "${_name}"
#  cd app/server/ruby/test
#  rake test
#}

package() {
  cd "${_name}/app"

  ./linux-release.sh

  mkdir -p "${pkgdir}/opt/${_name}"

  cp -r build/linux_dist/* "${pkgdir}/opt/${_name}/"

  # xdg
  install -vDm 644 ../${_name}.desktop -t "${pkgdir}/usr/share/applications/"

  install -vDm 644 gui/qt/images/icon-smaller.png "${pkgdir}/usr/share/icons/${_name}.png"

  # license
  install -vDm 644 ../LICENSE.md -t "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  install -vDm 755 ../../${_name}.sh "${pkgdir}/usr/local/bin/${_name}"

}
