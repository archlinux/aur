# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: Loui Chang <louipc.ist at gmail com>
# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=cgit-git
pkgver=1.2.3.r53.g907134b
pkgrel=1
pkgdesc='A web interface for git written in plain C - git checkout'
arch=('i686' 'x86_64')
url='https://git.zx2c4.com/cgit/'
license=('GPL2')
depends=('openssl' 'luajit')
makedepends=('git' 'zlib' 'curl' 'asciidoc')
optdepends=('groff: about page using man page syntax'
            'python-pygments: syntax highlighting support'
            'python-docutils: about page formatted with reStructuredText'
            'python-markdown: about page formatted with markdown'
            'lua51-luaossl: for lua filters'
            'gzip: gzip compressed snapshots'
            'bzip2: bzip2 compressed snapshots'
            'lzip: lzip compressed snapshots'
            'xz: xz compressed snapshots'
            'zstd: zstd compressed snapshots'
            'mime-types: serve file with correct content-type header')
conflicts=('cgit')
provides=('cgit')
install=cgit.install
source=('git+https://git.zx2c4.com/cgit.git'
        'git+https://github.com/git/git.git'
        'tmpfiles.conf'
        'apache.example.conf')
sha256sums=('SKIP'
            'SKIP'
            '4004b72d433e5810b046fc6019171a11a0dae3e9c6b29a44f16ed41705c46c3d'
            '89927d462c0504863c163eb8a210e5d65db30ee6e4300ff6a2f92460e4f20a62')

pkgver() {
	cd cgit/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

prepare() {
  cd cgit/

  git config --file=.gitmodules submodule.git.url ../git/
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd cgit/

  make
  make doc-man
}

check() {
  cd cgit/

  make test
}

package() {
  cd cgit/

  make CGIT_SCRIPT_PATH=/usr/share/webapps/cgit DESTDIR="${pkgdir}" prefix=/usr install install-man

  install -vDm0644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/cgit.conf"
  install -vDm0644 "${srcdir}/apache.example.conf" "${pkgdir}/etc/webapps/cgit/apache.example.conf"
  install -d "${pkgdir}/usr/lib/cgit"
  mv "${pkgdir}/usr/share/webapps/cgit/cgit.cgi" "${pkgdir}/usr/lib/cgit"
  ln -sf ../../../lib/cgit/cgit.cgi "${pkgdir}/usr/share/webapps/cgit/cgit.cgi"
}

