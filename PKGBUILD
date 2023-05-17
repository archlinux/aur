# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=gpt4all-chat-git
_gitname=gpt4all
pkgver=r746.d486103
pkgrel=1
pkgdesc="Cross platform Qt based GUI for GPT4All versions"
arch=('x86_64')
url="https://github.com/nomic-ai/gpt4all"
license=('MIT')
makedepends=('cmake' 'git')
depends=('qt6-base' 'qt6-httpserver')
conflicts=('gpt4all-chat')
provides=('gpt4all-chat')
source=(
  "${_gitname}::git+https://github.com/nomic-ai/gpt4all.git"
  "gpt4all-chat.desktop"
)
sha256sums=(
  'SKIP'
  '968ade77776bd88735b8dc370d5619378a131333694b7d43318bde02627f4c2b'
)


pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule update --init --recursive
  mkdir -p gpt4all-chat/build
  sed -i '/CMAKE_INSTALL_PREFIX/d' gpt4all-chat/CMakeLists.txt
}

build() {
  cd "${srcdir}/${_gitname}/gpt4all-chat/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/gpt4all-chat/build"

  DESTDIR="${pkgdir}" make install
  mv "${pkgdir}/usr/bin/chat" "${pkgdir}/usr/bin/gpt4all-chat"
  mv "${pkgdir}/usr/bin/test_hw" "${pkgdir}/usr/bin/gpt4all-test_hw"

	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

	cp "${srcdir}/gpt4all-chat.desktop" "${pkgdir}/usr/share/applications/"
	cp ../icons/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gpt4all-chat.svg"
}
