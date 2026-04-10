# Maintainer: L. Bradley LaBoon <brad@laboon.io>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Greg Sutcliffe <facter_aur (at) emeraldreverie.orgr>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail.com>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=openfact
pkgver=5.6.0
pkgrel=1
pkgdesc="Collect and display system facts"
arch=('any')
url="https://github.com/OpenVoxProject/${pkgname}"
license=('Apache-2.0')
depends=(
  dmidecode
  pciutils
  ruby
  ruby-base64
  ruby-hocon
  ruby-sys-filesystem
  ruby-thor
  virt-what
)
makedepends=(
  git
  ruby-rdoc
)
optdepends=('puppet: retrieve puppet facts')
provides=(
  facter
)
conflicts=(
  cpp-hocon
  leatherman
  libwhereami
  facter
)
replaces=(
  cpp-hocon
  leatherman
  libwhereami
)
source=(
  "git+${url}.git#tag=${pkgver}"
)
sha512sums=('d776f533403cd7b6720e5ac0b7b8e528aef8c057124c65d86d3841056332a937f1ccb4a729bcb6e4e2a8e68c3cd95d93972b1c0dee452bda267b13672b0f3195')
b2sums=('67c1ecd1ed1a7228f1a91bf90e6e4deae150f5664b2168387e5723847121dad68a01394d1e89517a687db5d01395a4864bb95bd38b5b0bf079816c272bf6d461')

build() {
  cd "${pkgname}"

  local _gemdir="$(gem env gemdir)"

  gem build --verbose "${pkgname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${pkgname}-${pkgver}.gem"

  # remove unreproducible files
  rm --force --recursive --verbose \
    "tmp_install${_gemdir}/cache/" \
    "tmp_install${_gemdir}/gems/${pkgname}-${pkgver}/vendor/" \
    "tmp_install${_gemdir}/doc/${pkgname}-${pkgver}/ri/ext/"

  find "tmp_install${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

package() {
  cd "${pkgname}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
