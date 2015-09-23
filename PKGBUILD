# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=play-git
pkgver=20130106
pkgrel=1
pkgdesc="Curses front-end for various audio players based on cplay"
arch=("i686" "x86_64")
url="http://git.sysphere.org/play/tree/README"
license=("GPL2")
depends=("ncurses" "python2")
makedepends=("git")
optdepends=("mpg123: for minimal mp3 support"
            "pyid3lib: for mp3 ID3 tags support"
            "id3-py: for mp3 ID3 tags alternative support"
            "vorbis-tools: for minimal ogg and flac support"
            "pyvorbis: for ogg tag metadata support"
            "mplayer: for proper flac, wma, m4a and m4b support")
install="${pkgname}.install"

_gitroot=http://git.sysphere.org/play
_gitname=play


build() {
  cd "${srcdir}"

# Download or update the library
  msg "Connecting to GIT server over HTTP..."
  if [[ -d "${_gitname}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local repository was updated."
  else
      git clone "${_gitroot}" "${_gitname}"
      msg "The remote repository was cloned."
  fi
  msg "GIT sync done, or server error (contact the maintainer)."
}


package() {
  cd "${srcdir}"

# Install the play binary
  install -D -m755 "${_gitname}/${_gitname}.py" "${pkgdir}/usr/bin/${_gitname}.py"

# Install the documentation
  install -D -m644 "${_gitname}/README" "${pkgdir}/usr/share/doc/${_gitname}/README"
# install -m644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/doc/${_gitname}"

# Generate the changelog
  git --git-dir="${_gitname}/.git" log --oneline > "${pkgdir}/usr/share/doc/${_gitname}/CHANGES"
}
