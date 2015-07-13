# Maintainer: Etienne Perot <etienne at perot dot me>
pkgname=parcimonie-sh-git
pkgver=45.d7d83f0
pkgrel=1
pkgdesc='Bash reimplementation of parcimonie - Refresh your GnuPG keyring without disclosing your whole contact list to the world'
arch=('any')
url='https://github.com/EtiennePerot/parcimonie.sh'
license=('WTFPL')
depends=('bash' 'torsocks' 'tor' 'gnupg')
makedepends=('git')
source=(
	'git://perot.me/parcimonie.sh'
	'pgp-key::https://perot.me/pgp-minimal.asc'
)
sha512sums=(
	'SKIP'
	'0f473fb9b853803570c8213eecbdf43f672cc55c6f39c59c9801b70bbdf33cddb7aedf44c0fc0fef632460c6325157dbf31d1043891ff186d2d064703f0fe97e'
)

pkgver() {
	cd "$startdir/parcimonie.sh"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	_dummy='' # Nothing; but apparently having just a comment causes a syntax error
}

check() {
	cd "$srcdir/parcimonie.sh"
		msg2 'Verifying GPG signature on HEAD commit.'
	export GNUPGHOME="$(pwd)/.gnupg"
	mkdir -p "$GNUPGHOME"
	chmod 700 "$GNUPGHOME"
	gpg --import < "$srcdir/pgp-key"
	gpgKeyId="$(gpg --batch --with-colons < "$srcdir/pgp-key" | grep '^sub:' | head -1 | cut -d ':' -f 5)"
	git log --max-count=1 --pretty="format:%H,%G?,%GK" HEAD | grep -q ",[GU],${gpgKeyId}\$"
	returnValue="$?"
	if [ "$returnValue" -eq 0 ]; then
		msg2 'Latest commit is properly signed.'
	else
		error "Latest commit '$(git rev-parse HEAD)' is not signed by GPG key '$gpgKeyId'."
	fi
	rm -r "$GNUPGHOME"
	unset GNUPGHOME
	return "$returnValue"
}

package() {
	cd "$srcdir/parcimonie.sh"
	install -D -m644 README.md "${pkgdir}/usr/share/parcimonie.sh/README.md"
	install -D -m755 parcimonie.sh "${pkgdir}/usr/share/parcimonie.sh/parcimonie.sh"
	install -D -m644 pkg/parcimonie.sh@.service "${pkgdir}/usr/lib/systemd/system/parcimonie.sh@.service"
	install -D -m644 pkg/sample-configuration.conf.sample "${pkgdir}/etc/parcimonie.sh.d/sample-configuration.conf.sample"
	install -D -m644 pkg/all-users.conf "${pkgdir}/etc/parcimonie.sh.d/all-users.conf"
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf /usr/share/parcimonie.sh/parcimonie.sh "${pkgdir}/usr/bin/parcimonie.sh"
}
