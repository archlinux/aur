# Maintainer: czyt <czytcn@gmail.com>
pkgname=kurocat-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Ultra-lightweight keyboard & mouse desktop cat pet, with full-state key capture and 2.5D head tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/chanke17/KuroCat"
license=('MIT')
# The program is built for GTK 3 and Cairo, and reads the keyboard and mouse
# through XInput2 / evdev on X11. The linker of the release links the whole
# group of GTK libraries, so they are all named here.
depends=('at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libgcc' 'libstdc++' 'libx11' 'libxi' 'pango')
provides=('kurocat')
conflicts=('kurocat' 'kurocat-git')
# The upstream binary is already stripped; stripping it again may break it.
options=('!strip' '!debug')

# The release carries the client as a Debian package for each architecture.
# The name of those files has no version in it, so the local copy gets one: a
# new release must not be served from the cache of the last one.
_deb_x86_64="KuroCat-Linux-${pkgver}-amd64.deb"
_deb_aarch64="KuroCat-Linux-${pkgver}-arm64.deb"

source=("LICENSE-${pkgver}::https://github.com/chanke17/KuroCat/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_deb_x86_64}::https://github.com/chanke17/KuroCat/releases/download/v${pkgver}/KuroCat-Linux-amd64.deb")
source_aarch64=("${_deb_aarch64}::https://github.com/chanke17/KuroCat/releases/download/v${pkgver}/KuroCat-Linux-arm64.deb")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums=('58bfcd4bbdaf17f433e1fee161351e6ca4135d18ae2d46178eafabb0d5a56be9')
sha256sums_x86_64=('11e0456d3d49d00b7111af2b6debb415a972a57e43d98c885f2a9fa24549c8e3')
sha256sums_aarch64=('6100cd6c97d4845c2259359d5a6f89f4a76ae2c3acb02f77222136580e50eec5')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"

  # Do not assume a compression for the payload of the Debian package: look
  # the member up instead.
  local data_archive
  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    echo "Could not find data.tar.* in ${deb}" >&2
    return 1
  fi

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # The Debian package carries no copyright file, so the licence is taken from
  # the repository of the release.
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
