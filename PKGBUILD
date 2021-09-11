# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-grammarous
pkgver=r201.db46357
# git clone https://github.com/rhysd/vim-grammarous.git && cd vim-grammarous && printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# `makepkg -so`, then update checksum
pkgrel=2
pkgdesc='A powerful grammar checker for Vim using LanguageTool'
arch=('any')
url='https://github.com/rhysd/vim-grammarous'
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'vim-vital' 'java-runtime>=8' 'languagetool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rhysd/vim-grammarous/archive/master.tar.gz")
sha256sums=('f052681a9b312bb0460dcb834c41324134b7cf493b791a4a5504250382567aea')

package () {
  cd "${pkgname}-master"

  # Install primary files
  install -d "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload doc plugin; do
    cp -r "$_dir" "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  # Remove file that would conflict with vim-vital, which is a dependency of this package instead
  rm "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"

  # Use system-wide installation of LanguageTool
  echo "let g:grammarous#languagetool_cmd = 'languagetool'" > "$pkgdir/usr/share/vim/vimfiles/plugin/grammarous.system_languagetool.vim"

  # Install licence
  install -d "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  grep '## License' README.md -A 100 > "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENCE"
}
