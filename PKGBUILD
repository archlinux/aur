# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=(libretro-scummvm-git libretro-scummvm-datafiles-git libretro-scummvm-coreinfo-git)
pkgver=r140537.75051b5
pkgrel=1
pkgdesc="ScummVM core"
arch=(x86_64 aarch64)
url=https://github.com/libretro/scummvm
license=(GPL)
groups=(libretro)
#depends=(libretro-core-info)
makedepends=(git wget unzip)
conflicts=(libretro-scummvm)
source=(git+https://github.com/libretro/scummvm.git remove_splash.patch)
# Regarding splash screen removal, the source states:
# // Please leave the splash screen in working order for your releases, even if they're commercial.
# // This is a proper and good way to show your appreciation for our hard work over these years.
# I disagree. Forced appreciation by showing an unnecessary screen and objectively worsen the core is not a good way at all.
# I apologize to all devs that take offense. I am grateful and appreciate your work very much!
sha512sums=(SKIP 0252280d86140476894a475738e42827dd6371ec50b46d58f432c43ea82330b750b9965ed42d62f5e46e327109546129b2a15410dbedce308e281e55c0abbb61)

# Where the datafiles will be installed
_sysdir=/home/player/.config/retroarch/system

# Who will own them (user:group)
_sysown=player:player

prepare() {
  patch --forward --strip=1 --input="remove_splash.patch"
}

pkgver() {
  cd scummvm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd scummvm/backends/platform/libretro
  make all
}

package_libretro-scummvm-git() {
  install -Dm 644 scummvm/backends/platform/libretro/scummvm_libretro.so -t "${pkgdir}/usr/lib/libretro/"
}

package_libretro-scummvm-datafiles-git() {
  mkdir -p "${pkgdir}${_sysdir}"
  unzip -q scummvm/backends/platform/libretro/scummvm.zip -d "${pkgdir}${_sysdir}"
  find "${pkgdir}${_sysdir}/scummvm" -type d -exec chmod 755 {} \;
  find "${pkgdir}${_sysdir}/scummvm" -type f -exec chmod 644 {} \;
  chown -R ${_sysown} "${pkgdir}${_sysdir}/scummvm"
}

package_libretro-scummvm-coreinfo-git() {
  install -Dm 644 scummvm/backends/platform/libretro/scummvm_libretro.info -t "${pkgdir}/usr/share/libretro/info/"
}
