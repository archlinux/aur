# Maintainer: zitro <94910351+0zitro@users.noreply.github.com>
# Contributor: Michael(Pineman13) <Pineman13@openaliasbox.org>

_pkgname='dmitry'
pkgname="${_pkgname}-git"
_release_version_label='1.3a'
pkgver=1.3a.r34.g32efb31
pkgrel=1

pkgdesc="Simple utility to perform host audition and extended whois queries using Google and ICANN (git version)"
arch=('i686' 'x86_64')
url='http://mor-pah.net/software/dmitry-deepmagic-information-gathering-tool/'
license=('GPL')
depends=('glibc')

_github_username='jaygreig86'
# _git_branch='master'
# source=("${_pkgname}::git+https://github.com/${_github_username}/${_pkgname}#branch=${_git_branch}")
source=("${_pkgname}::git+https://github.com/${_github_username}/${_pkgname}")
md5sums=('SKIP')
# Even though the latest master is signed, I believe it's for the best to not use signing,
#   because many AUR helpers have some kind of `devel` feature, where if the PKGBUILD had not changed,
#   only the source repo is updated, without loading the new PKGBUILD from the AUR.
# Thus, I will leave the source without `?signed` so as to not pull the sig, lest breaking the feature
#   by subsequently needing to change the PKGBUILD/.SRCINFO, except of course something truly needs
#   to be changed, of course (as in this change, changing the PKGBUILD to use the upstream repo).


pkgver() {
  cd "${srcdir}/${_pkgname}";

  # Create an annotated tag at the first commit, which (I believe) corresponds to the latest release (1.3a)
  GIT_COMMITTER_NAME=makepkg GIT_COMMITTER_EMAIL=makepkg@localmachine.localhost \
    git tag --no-sign --force -am "${_release_version_label}" "${_release_version_label}" 'df1258d2f4176bd56656577db6b7b16db4678775' \
    >/dev/null 2>&1;

  git describe --long --tags | sed -re 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g';
}

build() {
  cd "${srcdir}/${_pkgname}";

  ./configure --prefix=/usr;
  make;
}

package() {
  cd "${srcdir}/${_pkgname}";

  make DESTDIR="${pkgdir}" install;
}
