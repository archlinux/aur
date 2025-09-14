# Maintainer: Brany <code@garage-c0.re>
# Contributor: Robert Pannick <rwpannick@gmail.com>
# Contributor: Nigel Michki <nigeil@yahoo.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Serhii Balbieko <sergey@balbeko.com>
# Contributor: Simon Dreher <code@simon-dreher.de>

_name=sonic-pi

pkgname=sonic-pi-git
pkgver=v4.6.0.r12.ge5da6b3
pkgrel=2
pkgdesc="The Live Coding Music Synth for Everyone"

arch=('x86_64')
url="http://sonic-pi.net/"
license=('MIT')

groups=('pro-audio')

conflicts=('sonic-pi')
provides=('sonic-pi')

# depends=('aubio' 'elixir' 'gcc-libs'
# 'sc3-plugins' 'sox' 'supercollider')
depends=('ruby'  'aubio')
makedepends=('ruby-prime' 'ruby-racc' 'ruby-erb' 'ruby-rexml'
    'qt5-base' 'qt5-svg' 'qt6-base' 'qt6-svg' 'qt6-tools'
    'elixir' 'erlang-asn1' 'erlang-public_key' 'erlang-ssl' 'erlang-parsetools' 'erlang-sasl'
    'git' 'boost' 'cmake' 'gendesk' 'patchelf')

source=('git+https://github.com/sonic-pi-net/sonic-pi.git'
        "${_name}.sh")

sha512sums=('SKIP'
            'bb578996b305fbb07b95610caf1fc1a08c760a49cf3902f012ed49ee4404f7d8c10d66aded88e538b20c811b4bb21c4e17f47761863eebd2bff2792ec38a738d')

pkgver() {
  cd "${_name}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}/app"
  ./linux-build-all.sh
}

package() {

  pushd "${_name}"

  gendesk -f -n \
          --pkgname "${pkgname}" \
          --pkgdesc "${pkgdesc}" \
          --name "${_name}" \
          --exec "${_name}" \
          --categories "AudioVideo;Audio"


  pushd "app"

  ./linux-release.sh
  #=This should be in linux-release.sh
  mkdir -p build/linux_dist/lib
  find . -name "*.so.*" -exec cp {} build/linux_dist/lib/ \;

  pushd "build/linux_dist"
  patchelf --set-rpath '$ORIGIN/../../../lib' app/build/gui/sonic-pi
  popd
  #===================================

  mkdir -p "${pkgdir}/opt/${_name}"
  cp -r build/linux_dist/* "${pkgdir}/opt/${_name}/"

  # xdg
  install -vDm 644 ../${_name}.desktop -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 gui/images/icon-smaller.png "${pkgdir}/usr/share/icons/${_name}.png"

  # license
  install -vDm 644 ../LICENSE.md -t "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -vDm 755 ../../${_name}.sh "${pkgdir}/usr/local/bin/${_name}"

}
