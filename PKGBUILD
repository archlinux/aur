# Maintainer: Zhiya Luo <luozhiya@petalmail.com>
# Contributor: Hammer <topo20@protonmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Sinofine Lotus <i@sinofine.me>

pkgname=mogan
pkgver=1.2.5.1
_tagver=v${pkgver//_/-}
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=("x86_64")
url="https://github.com/XmacsLabs/mogan"
license=("GPL3")
# The QT environment is automatically detected by xmake by default, but if the QT SDK environment is not found, users can manually specify the QT SDK Environment directory,  ```xmake f --qt=~/Qt/Qt5.9.1```
#  Because we cannot know the exact QT path, we have added support for QT5 and QT6 to be compatible with the user's environment.
#  1. If the user installs both QT5 and QT6, xmake will automatically select QT5.
#  2. If the user only installs QT6 or QT5, xmake will select the unique one.
depends=("qt5-base" "qt5-svg" "qt6-base" "qt6-svg" "sqlite" "zlib" "unzip" "curl" "texlive-core" "python" "libxext" "libgit2")
makedepends=("git" "xmake")
optdepends=(
  "gawk: Conversion of some files"
  "ghostscript: Rendering ps files"
  "imagemagick: Convert images"
  "aspell: Spell checking")
source=("${pkgname}::git+${url}.git#tag=${_tagver}"
        "mogan.desktop"
        "mogan.xml")
sha256sums=("SKIP"
            "SKIP"
            "SKIP")

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cd "${pkgname}"
  xmake repo --update --yes
  xmake config -vD --policies=build.ccache -m releasedbg --yes
  xmake build --yes -vD research
}

package() {
  cd "${pkgname}"

  # Running makepkg in fakeroot environment
  xmake install --root -o "${pkgdir}"/usr research

  # Fix "Can"t translate pathname "usr/share/Xmacs/tests/64_1_中文文件名.tm" to UTF-8"
  rm -rf "${pkgdir}"/usr/share/Xmacs/tests

  # For version == 1.2.0 compatible vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

  # Install desktop
  # rm "${pkgdir}"/usr/share/applications/texmacs.desktop
  # install -D -m 644 "${srcdir}"/mogan.desktop "${pkgdir}"/usr/share/applications/mogan.desktop

  # Install minetype
  # rm "${pkgdir}"/usr/share/mime/packages/texmacs.xml
  # install -D -m 644 "${srcdir}"/mogan.xml "${pkgdir}"/usr/share/mime/packages/mogan.xml
  # install -D -m 644 "${pkgdir}/usr/share/Xmacs/misc/images/text-x-mogan.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/text-x-mogan.svg"

  # Install icons
  # rm -rf ${pkgdir}/usr/share/icons
  # resolutions=(16 32 128 512)
  # for resolution in "${resolutions[@]}"
  # do
  #   install -D -m 644 "${pkgdir}/usr/share/Xmacs/misc/images/new-mogan-${resolution}.png" \
  #     "${pkgdir}/usr/share/icons/hicolor/${resolution}x${resolution}/apps/new-mogan.png"
  # done
  # install -D -m 644 "${pkgdir}/usr/share/Xmacs/misc/images/new-mogan.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/new-mogan.svg"

  # For version == 1.2.0 compatible ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
}

# vim:set sw=2 sts=2 et:
