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
pkgver=5.6.1
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
sha512sums=('13944457d98f39464cc737efeecb07ea843970c5e4415b1d487f9bc7890553e7867d3e388db52f9034610fa9b43bd051f12fb20473525c7b0eeebfbc5935b134')
b2sums=('3d11e355e74b96bd47a2dfc53345e4f391d20658856a83026988b998592f5bdf8f5e91dd0b2b245e9dbc56106da71b9d8814101b3f5aa48f730b26cccda38188')

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
