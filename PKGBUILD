# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: jcsiv <siviter dot jamie at gmx dot co dot uk>
# Contributor: ThinCarrotShrimp <christoph.r.martin+arch at gmail dot com>

pkgname=oh-my-zsh-git
pkgver=3143.4224c2a
pkgrel=1
pkgdesc="A community-driven framework for managing your zsh configuration. Includes 180+ optional plugins and over 120 themes to spice up your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community"
arch=('any')
url='https://github.com/robbyrussell/oh-my-zsh'
license=('MIT')
depends=('zsh')
makedepends=('git')
optdepends=('ruby: for some plugin functionality'
            'oh-my-zsh-powerline-theme-git: great theme'
            'bullet-train-oh-my-zsh-theme-git: better powerline theme'
            'git: most themes use git (highly recommended but still optional)')
install='oh-my-zsh-git.install'
source=("$pkgname::git+git://github.com/robbyrussell/oh-my-zsh.git")
md5sums=('SKIP')
# conflicts=('grml-zsh-config'
#            'grml-zsh-config-git')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  mkdir -p "${pkgdir}/usr/share/oh-my-zsh"

  # Fix the path to oh-my-zsh, and disable auto-updating.
  sed -e '2c\ZSH=/usr/share/oh-my-zsh/'\
      -e 's/# \(DISABLE_AUTO_UPDATE="true"\)/\1/'\
      templates/zshrc.zsh-template > zshrc

  # Update zshrc with a per user writable cache (thanks apjanke!)
  echo "" >> zshrc
  echo "ZSH_CACHE_DIR=\$HOME/.oh-my-zsh-cache" >> zshrc
  echo "if [[ ! -d \$ZSH_CACHE_DIR ]]; then" >> zshrc
  echo "  mkdir \$ZSH_CACHE_DIR" >> zshrc
  echo "fi" >> zshrc

  # Move any sourcing to the end of the file
  sed -i '/^source/{H;$!d;s/.*//};$G;s/\n*//' zshrc

  # We don't need anything related to git in the package.
  rm -rf .git*

  # We don't need {check_for_,}upgrade.sh, {un,}install.sh
  rm -f tools/upgrade.sh tools/uninstall.sh tools/install.sh tools/check_for_upgrade.sh

  # The license should be in /usr/share/licenses.
  install -D -m644 MIT-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm MIT-LICENSE.txt

  # Copy everything else.
  cp -r . "${pkgdir}/usr/share/oh-my-zsh/"
}

# vim:set ts=2 sw=2 et:
