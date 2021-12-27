# Maintainer: Anthony Wang <ta180m@pm.me>
pkgname=oh-my-git-git
pkgver=r465.929c634
pkgrel=2
pkgdesc='An interactive Git learning game!'
arch=(x86_64)
url='https://ohmygit.org/'
license=(custom)
makedepends=(godot zip)
godotver=$(godot --version | cut -d'.' -f1-3)
source=("${pkgname}::git+https://github.com/git-learning-game/oh-my-git.git"
        "https://downloads.tuxfamily.org/godotengine/${godotver}/Godot_v${godotver}-stable_export_templates.tpz"
        oh-my-git
        oh-my-git.desktop
        icon.png)
sha512sums=('SKIP'
            'SKIP'
            '617b41e7fc2f05c6cb5c06ef3f0ef134d52bb40d8461b6b0013acf0d0903a96aa3f614da593d3a06072162caadd233e327aa7006b67b69da647cec6eb8fa653f'
            '7bfc8766cc46c1a2c8ffa63e1d6613763d91f38a53c6ef31ff3943305880507796e4704fdfea814f7af54f43040011291f6dd7f954bbe67adac95562df7a69f0'
            '12816c20c190222f3a70937a3721184a94fc4ea9a36e55fe4873f06a0b4e8205b34f7927b880a5968588db228051ab87a5168abddf882303a70c9b61fdb39e08')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd templates

  mkdir -p $HOME/.local/share/godot/templates/${godotver}.stable
  cp linux_x11_64* $HOME/.local/share/godot/templates/${godotver}.stable

  cd ../"${pkgname}"

  make linux
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
