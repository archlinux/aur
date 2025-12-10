# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: David Roheim < david dot roheim at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >

# Uncomment to enable usermode support
#_with_usermode=1

pkgname=mock
pkgver=6.6
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="A simple chroot build environment manager for building RPMs"
url="https://github.com/rpm-software-management/$pkgname"
arch=('any')
license=('GPL-2.0-or-later')
depends=('mock-core-configs>=39' 'python' 'python-backoff' 'python-distro'
         'python-pyroute2' 'python-requests' 'python-templated-dictionary>=1.5'
         'rpm-tools')
((_with_usermode)) && depends+=('usermode')
makedepends=('python-argparse-manpage')
optdepends=('buildah: for export_buildroot_image plugin'
            'createrepo_c: for mockchain command'
            'dnf-plugins-core: to build RPMs for DNF based distributions (hint: use bootstrap images instead)'
            'dnf5: to build RPMs for DNF5 based distributions (hint: use bootstrap images instead)'
            'lvm2: for lvm_root plugin'
            'nosync: to speed up yum/dnf database access'
            'pigz: for parallel compression of chroot cache'
            'podman: to use bootstrap images (recommended)'
            'procenv: for procenv plugin')
install="$pkgname.install"
backup=("etc/$pkgname/logging.ini"
        "etc/$pkgname/hermetic-build.cfg"
        "etc/$pkgname/site-defaults.cfg")
source=("$url/archive/$_pkgtag.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('dbeb1c6415c1fcf43bc67234b00eb6da25569899c92b9ffb26cf6495e3060842'
            'f6cba3f7e7f35c3d811f548af9ff2044764b6b65eb9bd74f035904c0c8463651'
            'a32ef4b3a19490280d3e8fcdebe9dd3348636a97e214850ce6cfc6bffa56a5d3')

_prefix=/usr
_bindir=$_prefix/bin
_datadir=$_prefix/share
_docdir=$_datadir/doc/$pkgname
_mandir=$_datadir/man
_sysconfdir=/etc

prepare() {
	mv "$pkgname-$_pkgtag" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"

	sed -e "s|@MOCK_DOCS@|$_docdir|" -i "mock-core-configs/etc/$pkgname/site-defaults.cfg"
}

build() {
	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	python_sitelib=$(python -c 'from sysconfig import get_path; import sys; sys.stdout.write(get_path(name="purelib"))')
	sed -r -i py/mockbuild/constants.py py/mock-parse-buildlog.py \
	    -e 's|^VERSION\s*=.*|VERSION="'$pkgver'"|' \
	    -e 's|^SYSCONFDIR\s*=.*|SYSCONFDIR="'$_sysconfdir'"|' \
	    -e 's|^PYTHONDIR\s*=.*|PYTHONDIR="'$python_sitelib'"|' \
	    -e 's|^PKGPYTHONDIR\s*=.*|PKGPYTHONDIR="'$python_sitelib'/mockbuild"|'

	# Replace /usr/libexec path in help message
	sed -r -i "py/$pkgname.py" \
	    -e 's|/usr/libexec/mock/mock|/usr/bin/mock.py|'

	sed -e "s|@VERSION@|$pkgver|" -i "docs/$pkgname"{,-parse-buildlog}.1
	sed -e "s|^_MOCK_NVR = None\$|_MOCK_NVR = \"$pkgname-$pkgver-$_rpmrel\"|" -i "py/$pkgname.py"

	python    -m compileall py/ -q
	python -O -m compileall py/ -q


	argparse-manpage --pyfile py/mock-hermetic-repo.py --function _argparser >docs/mock-hermetic-repo.1

	popd >/dev/null
}

package() {
	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	mkdir -p "$pkgdir/$_bindir/"
	install -Dp -m755 py/mock.py "$pkgdir/$_bindir/"mock
	install -Dp -m755 mockchain  "$pkgdir/$_bindir/"mockchain
	install -Dp -m755 py/mock-parse-buildlog.py "$pkgdir/$_bindir/"mock-parse-buildlog

	mkdir -p "$pkgdir/$_sysconfdir/"pam.d
	cp -Rp etc/pam/* "$pkgdir/$_sysconfdir/"pam.d/

	mkdir -p "$pkgdir/$_sysconfdir/"mock
	cp -Rp etc/mock/* "$pkgdir/$_sysconfdir/"mock/
	cp -p ../mock-core-configs/etc/mock/site-defaults.cfg "$pkgdir/$_sysconfdir/"mock/

	mkdir -p "$pkgdir/$_datadir/"bash-completion/completions
	cp -Rp etc/bash_completion.d/* "$pkgdir/$_datadir/"bash-completion/completions/
	ln -s mock "$pkgdir/$_datadir/"bash-completion/completions/mock-parse-buildlog

	mkdir -p "$pkgdir/$_sysconfdir/"pki/mock
	cp -Rp etc/pki/* "$pkgdir/$_sysconfdir/"pki/mock/

	python_sitelib=$(python -c 'from sysconfig import get_path; import sys; sys.stdout.write(get_path(name="purelib"))')
	mkdir -p "$pkgdir/$python_sitelib/"
	cp -Rp py/mockbuild "$pkgdir/$python_sitelib/"

	mkdir -p "$pkgdir/$_mandir/"man1
	cp -Rp "docs/$pkgname"{,-hermetic-repo,-parse-buildlog}.1 "$pkgdir/$_mandir/"man1/

	if ((_with_usermode)); then
		mkdir -p "$pkgdir/$_sysconfdir/"security/console.apps/
		cp -Rp etc/consolehelper/$pkgname "$pkgdir/$_sysconfdir/"security/console.apps/$pkgname

		mv "$pkgdir/usr/bin/$pkgname"{,.py}
		sed -e "s|/usr/libexec/$pkgname/$pkgname|/usr/bin/$pkgname.py|" \
		    -i "$pkgdir/etc/security/console.apps/$pkgname"
		ln -s /usr/bin/consolehelper "$pkgdir/usr/bin/$pkgname"
	fi

	install -Dp -m644 docs/site-defaults.cfg "$pkgdir/$_docdir/site-defaults.cfg"
	install -Dp -m644 docs/mock.cheat "$pkgdir/$_docdir/cheat/$pkgname"

	popd >/dev/null

	install -Dp -m644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dp -m644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim: set ft=sh ts=4 sw=4 noet:
