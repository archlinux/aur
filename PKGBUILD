# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Etienne Perot <etienne at perot dot me>

pkgname=parcimonie-sh-git
pkgver=73.551999c
pkgrel=1
pkgdesc='Bash reimplementation of parcimonie - Refresh your GnuPG keyring without disclosing your whole contact list to the world'
arch=('any')
url='https://github.com/EtiennePerot/parcimonie.sh'
license=('custom:WTFPL')
depends=('bash' 'torsocks' 'tor' 'gnupg')
makedepends=('git')
source=('git+https://github.com/EtiennePerot/parcimonie.sh'
        'pgp-key::https://perot.me/pgp-minimal.asc')
b2sums=('SKIP'
        'b0a2a2394ce27e6271344a85ae3547e3d80deca3e16709d1d86c2da31fb6d89968062e56e6db214e1f8fc16fb6e86f5dc17acdd30ef8120f4f0bbd9ccdca4b78')

pkgver() {
	cd parcimonie.sh
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

check() {
	cd parcimonie.sh
	msg2 'Verifying GPG signature on HEAD commit.'
	export GNUPGHOME="$(pwd)"/.gnupg
	mkdir -p "$GNUPGHOME"
	chmod 700 "$GNUPGHOME"
	gpg --import < "${srcdir}"/pgp-key
	gpgKeyId="$(gpg --show-key --batch --with-colons < "${srcdir}"/pgp-key | grep '^sub:' | head -1 | cut -d ':' -f 5)"
	git log --max-count=1 --pretty="format:%H,%G?,%GK" HEAD | grep -q ",[GU],${gpgKeyId}\$"
	returnValue="$?"
	if [ "$returnValue" -eq 0 ]; then
		msg2 'Latest commit is properly signed.'
	else
		error "Latest commit '$(git rev-parse HEAD)' is not signed by GPG key '$gpgKeyId'."
	fi
	rm -r "${GNUPGHOME}"
	unset GNUPGHOME
	return "${returnValue}"
}

package() {
	cd parcimonie.sh
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 README.md "${pkgdir}"/usr/share/parcimonie.sh/README.md
	install -D -m755 parcimonie.sh "${pkgdir}"/usr/share/parcimonie.sh/parcimonie.sh
	install -D -m644 pkg/parcimonie.sh@.service "${pkgdir}"/usr/lib/systemd/system/parcimonie.sh@.service
	install -D -m644 pkg/sample-configuration.conf.sample "${pkgdir}"/etc/parcimonie.sh.d/sample-configuration.conf.sample
	install -D -m644 pkg/all-users.conf "${pkgdir}"/etc/parcimonie.sh.d/all-users.conf
	mkdir -p "${pkgdir}"/usr/bin
	ln -sf /usr/share/parcimonie.sh/parcimonie.sh "${pkgdir}"/usr/bin/parcimonie.sh
}
