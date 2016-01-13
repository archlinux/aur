# Maintainer: Eugene Baiev <thedraik at gmail.com>

pkgname=fizsh-git
pkgver=1.0.8.r8.g95d0050
pkgrel=1
pkgdesc="Friendly Interactive ZSHell"
arch=('any')
url="https://github.com/zsh-users/fizsh"
license=('custom:BSD')
depends=('zsh')
makedepends=('git')
source=("${pkgname}::git+https://github.com/zsh-users/fizsh.git")
md5sums=('SKIP')
backup=('etc/fizsh/brackets-highlighter.zsh'
		'etc/fizsh/cursor-highlighter.zsh'
		'etc/fizsh/fizsh-miscellaneous.zsh'
		'etc/fizsh/fizsh-prompt.zsh'
		'etc/fizsh/fizshrc.zsh'
		'etc/fizsh/main-highlighter.zsh'
		'etc/fizsh/modify-etc-shells.sh'
		'etc/fizsh/pattern-highlighter.zsh'
		'etc/fizsh/root-highlighter.zsh'
		'etc/fizsh/zsh-history-substring-search.zsh'
		'etc/fizsh/zsh-syntax-highlighting.zsh'
	   )

pkgver(){
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  cd "${pkgname}"
  git checkout -b tags/${pkgver}
}

build(){
  cd "${pkgname}"
  ./configure --prefix=/usr --includedir=/usr/include --datadir=/usr/share \
              --bindir=/usr/bin --libexecdir=/usr/lib/fizsh \
              --localstatedir=/var --sysconfdir=/etc/
  make
}

package() {
  cd "${pkgname}"
  
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  mkdir -p "${pkgdir}/usr/share/man1/"
  gzip --best -c "${srcdir}/${pkgname}/man/fizsh.1" > "${pkgdir}/usr/share/man1/${pkgname%-git}.gz"
  
  make DESTDIR="${pkgdir}/" install
}
