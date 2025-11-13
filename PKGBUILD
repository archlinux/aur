# Maintainer: Anthony Wang <ta180m@pm.me>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
pkgname=oh-my-git-git
pkgver=0.6.5.r23.gc64e8f2
pkgrel=1
pkgdesc='An interactive Git learning game!'
arch=(x86_64)
url='https://ohmygit.org/'
license=(custom)
depends=(libglvnd libxcursor libxi libxinerama libxrandr libxrender)
makedepends=(git godot3 godot3-export-templates xorg-server-xvfb zip)
source=("${pkgname}::git+https://github.com/git-learning-game/oh-my-git.git"
        oh-my-git
        oh-my-git.desktop
        icon.png)
sha512sums=('SKIP'
            '617b41e7fc2f05c6cb5c06ef3f0ef134d52bb40d8461b6b0013acf0d0903a96aa3f614da593d3a06072162caadd233e327aa7006b67b69da647cec6eb8fa653f'
            '7bfc8766cc46c1a2c8ffa63e1d6613763d91f38a53c6ef31ff3943305880507796e4704fdfea814f7af54f43040011291f6dd7f954bbe67adac95562df7a69f0'
            '12816c20c190222f3a70937a3721184a94fc4ea9a36e55fe4873f06a0b4e8205b34f7927b880a5968588db228051ab87a5168abddf882303a70c9b61fdb39e08')

pkgver() {
  cd "${srcdir}/${pkgname}"

  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  cd "${srcdir}/${pkgname}"
  # workaround to build a local godot application via godot3 binary
  # and any godot templates with the same minor version
  sed -i 's/\bgodot\b/godot3/g' Makefile
  local godot_version templates_dir godot_minor
  godot_version=$(godot3 --version)
  godot_version=${godot_version/.stable*/.stable}
  godot_minor=${godot_version%.*.*}
  for bin in godot godot3; do
    templates_dir="${srcdir}/templates/$bin/templates"
    mkdir -p "$templates_dir"
    ln -sf --no-dereference /usr/share/godot/templates/"$godot_minor"* "$templates_dir/$godot_version"
  done
  # build game
  XDG_DATA_HOME="${srcdir}/templates" xvfb-run make linux
}

package() {
  install -Dm755 oh-my-git "$pkgdir/usr/bin/oh-my-git"
  install -Dm644 icon.png "$pkgdir/usr/share/${pkgname%-git}/icon.png"
  install -Dm644 oh-my-git.desktop "$pkgdir/usr/share/applications/oh-my-git.desktop"

  cd "${srcdir}/${pkgname}"

  install -Dm755 build/oh-my-git-linux/oh-my-git "$pkgdir/usr/lib/${pkgname%-git}/oh-my-git"
  install -Dm644 build/oh-my-git-linux/oh-my-git.pck "$pkgdir/usr/lib/${pkgname%-git}/oh-my-git.pck"
}

# vim:set sw=2 sts=2 et:
