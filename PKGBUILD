pkgname=fuoevolve-bin
pkgver=1.6.3
pkgrel=1
pkgdesc='Open-source cross-platform music player based on FeelUOwn (prebuilt binary)'
arch=('x86_64')
url='https://feeluown.github.io/FuoEvolve/'
license=('GPL-3.0-only')
provides=("fuoevolve=${pkgver}")
conflicts=('fuoevolve')
depends=(
  'gtk3'
  'libx11'
  'libxkbcommon'
  'libsecret'
  'mpv'
  'webkit2gtk-4.1'
  'alsa-lib'
  'pipewire'
  'libpulse'
)
makedepends=('libarchive')
options=('!strip')
_archive="FuoEvolve-${pkgver}-linux-x64.pkg.tar.zst"
source=("${_archive}::https://github.com/feeluown/FuoEvolve/releases/download/${pkgver}/${_archive}")
noextract=("${_archive}")
sha256sums=('5f5edcd092df3265a2b43e044713f9f07066cb0edc6c8d11f29984cffb4c3c0b')

package() {
  # The upstream release archive is a completed pacman package. Repackage only
  # its installed files; makepkg must generate metadata for fuoevolve-bin itself.
  if ! bsdtar -tf "${srcdir}/${_archive}" | grep -E '^(\./)?\.PKGINFO$' > /dev/null; then
    echo 'Release asset is not a valid Arch package: missing .PKGINFO' >&2
    return 1
  fi

  bsdtar \
    --exclude='.PKGINFO' \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.INSTALL' \
    --exclude='.CHANGELOG' \
    -xf "${srcdir}/${_archive}" \
    -C "${pkgdir}"

  if [[ ! -d "${pkgdir}/usr" ]]; then
    echo 'Release asset has no usr/ payload' >&2
    return 1
  fi
}
