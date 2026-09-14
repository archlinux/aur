# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Honghao Li <im@rasphino.cn>

pkgname=sublime-merge
pkgver=2130
pkgrel=2
pkgdesc='Meet a new Git Client, from the makers of Sublime Text'
arch=('x86_64')
url='https://www.sublimemerge.com'
license=('custom')
depends=('gtk3')
source=("https://download.sublimetext.com/sublime_merge_build_${pkgver}_x64.tar.xz"
        "https://download.sublimetext.com/sublime_merge_build_${pkgver}_x64.tar.xz.asc"
        LICENSE)
b2sums=('7c0b98b897adeb50397565237e48d4b5cd4e5cc88526f7efcab06c2ff7ec4c66017fc46ffb556e7e47cd0963f6bc682ffda416404e2a13b10a841411a6c20e7e'
        'SKIP'
        'e17f9223fc423b385d20f78fd54bf8bdc0722134cb89e1a12f9105a4d130e9ae12f81997904b52ce6d6db45810d23db53c8f90c8a9bc1ac0ae4a8532d1097396')
validpgpkeys=('EBC733B78AAB352DC773BF857FE2FA12CF6E38F2')

package() {
  cd sublime_merge
  install -dm755 "${pkgdir}"/usr/bin

  # Install binaries
  install -Dm755 -t "${pkgdir}"/opt/sublime_merge/ \
    crash_handler \
    git-credential-sublime \
    ssh-askpass-sublime \
    sublime_merge

  # link executable to /usr/bin/
  ln -s /opt/sublime_merge/sublime_merge "${pkgdir}"/usr/bin/smerge

  # copy misc files
  cp --preserve=mode -r -t "${pkgdir}"/opt/sublime_merge/ \
    changelog.txt \
    Packages \
    Icon

  # link app icons to system folder
  for res in 256x256 128x128 48x48 32x32 16x16; do
    install -dm755 "${pkgdir}"/usr/share/icons/hicolor/${res}/apps
    ln -s /opt/sublime_merge/Icon/${res}/sublime-merge.png "${pkgdir}"/usr/share/icons/hicolor/${res}/apps/sublime-merge.png
  done

  # install desktop file and license
  install -Dm644 -t "${pkgdir}"/usr/share/applications/ "${srcdir}"/sublime_merge/sublime_merge.desktop
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/LICENSE
}
