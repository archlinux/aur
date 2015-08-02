# $Id$
# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors



# Upstream has extra spacing in the default theme, necessary in other distributions
# If you want to remove these, since they aren't needed on arch, uncomment (remove the # on) the line below
_install_removed_spacing_patch=1



pkgname=bash-git-prompt-git
_pkgname=bash-git-prompt
pkgver=2.3.5.r249.2a6b20c
pkgrel=1
pkgdesc="Informative git prompt for bash and fish (git version)"
arch=('any')
url="https://github.com/magicmonty/bash-git-prompt"
depends=('bash')
optdepends=('fish: git prompt in fish support')
makedepends=('git')
provides=('bash-git-prompt')
conflicts=('bash-git-prompt')
license=('custom:BSD 2 Clause (NetBSD)')
source=("git+https://github.com/magicmonty/${_pkgname}"
        'bash-git-prompt.install'
        'removed_spacing.patch')
md5sums=('SKIP'
         '1e762bd413b6efdec225928da5aa6451'
         '513706d4f97f775a60325bc31574d197')
install='bash-git-prompt.install'

pkgrel() {
  echo $(cat bash-git-prompt.rb | grep url | sed 's|.*archive/||' | sed 's|.tar.gz"$||').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  if [ -n "$_install_removed_spacing_patch" ]; then
    cd ${srcdir}/${_pkgname}
    echo "Installing removed_spacing.patch..."
    patch -p1 -i ${srcdir}/removed_spacing.patch
  else
    echo "NOT installing removed_spacing.patch..."
  fi
}

package() {
  cd ${srcdir}/${_pkgname}

  install -Dm644 gitprompt.fish ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.fish
  install -Dm755 git-prompt-help.sh ${pkgdir}/usr/lib/bash-git-prompt/git-prompt-help.sh
  install -Dm755 gitprompt.sh ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.sh
  install -Dm755 gitstatus.sh ${pkgdir}/usr/lib/bash-git-prompt/gitstatus.sh
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 prompt-colors.sh ${pkgdir}/usr/lib/bash-git-prompt/prompt-colors.sh
  install -Dm644 README.md ${pkgdir}/usr/lib/bash-git-prompt/README.md

  cd themes
  install -Dm644 Custom.bgptemplate ${pkgdir}/usr/lib/${_pkgname}/themes/Custom.bgptemplate
  install -Dm644 Default.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Default.bgptheme
  install -Dm644 Default_NoExitState.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Default_NoExitState.bgptheme
  install -Dm644 Single_line.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Single_line.bgptheme
  install -Dm644 Single_line_openSUSE.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Single_line_openSUSE.bgptheme
  install -Dm644 Solarized.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Solarized.bgptheme
  install -Dm644 Solarized_NoExitState.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Solarized_NoExitState.bgptheme
}
