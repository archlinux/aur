# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: David Roheim < david dot roheim at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=mock
pkgver=6.8
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="A simple chroot build environment manager for building RPMs"
url="https://github.com/rpm-software-management/$pkgname"
arch=('any')
license=('GPL-2.0-or-later')
depends=('mock-core-configs>=45' 'polkit' 'python' 'python-backoff'
         'python-distro' 'python-pyroute2' 'python-requests'
         'python-templated-dictionary>=1.5' 'rpm-tools')
makedepends=('python-argparse-manpage')
optdepends=('buildah: for export_buildroot_image plugin'
            'createrepo_c: for mockchain command'
            'dnf-plugins-core: to build RPMs for DNF based distributions (hint: use bootstrap images instead)'
            'dnf5: to build RPMs for DNF5 based distributions (hint: use bootstrap images instead)'
            'lvm2: for lvm_root plugin'
            'nosync: to speed up yum/dnf database access'
            'pigz: for parallel compression of chroot cache'
            'podman: to use bootstrap images (recommended)'
            'procenv: for procenv plugin'
            'skopeo: for hermetic bootstrap images')
install="$pkgname.install"
backup=('etc/mock/logging.ini'
        'etc/mock/hermetic-build.cfg'
        'etc/mock/site-defaults.cfg')
source=("$url/archive/$_pkgtag.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('117006ef574ee7c9b5235fc8fa5c3cf2f5a8b4d2f6931222b9d2ad048fe865d5'
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

	sed -e "s|@MOCK_DOCS@|$_docdir|" -i mock-core-configs/etc/mock/site-defaults.cfg

	pushd mock >/dev/null

	# Replace /usr/libexec path in help message
	sed -i etc/polkit/{mock-pkexec.sh,org.rpm.mock.policy} py/mock.py \
	    -e 's|/usr/libexec/mock/mock|/usr/bin/mock.py|'

	popd >/dev/null
}

build() {
	cd "$pkgname-$pkgver"

	pushd mock >/dev/null

	python_sitelib=$(python -c 'from sysconfig import get_path; import sys; sys.stdout.write(get_path(name="purelib"))')
	sed -r -i py/mockbuild/constants.py py/mock-parse-buildlog.py \
	    -e 's|^VERSION\s*=.*|VERSION="'$pkgver'"|' \
	    -e 's|^SYSCONFDIR\s*=.*|SYSCONFDIR="'$_sysconfdir'"|' \
	    -e 's|^PYTHONDIR\s*=.*|PYTHONDIR="'$python_sitelib'"|' \
	    -e 's|^PKGPYTHONDIR\s*=.*|PKGPYTHONDIR="'$python_sitelib'/mockbuild"|'

	sed -e "s|@VERSION@|$pkgver|" -i docs/mock{,-parse-buildlog}.1
	sed -e "s|^_MOCK_NVR = None\$|_MOCK_NVR = \"$pkgname-$pkgver-$_rpmrel\"|" -i py/mock.py

	sed -r -i docs/site-defaults.cfg py/mockbuild/config.py \
	    -e 's|config_opts\["shadow_utils_isolation_option"\] = .*|config_opts["shadow_utils_isolation_option"] = "--root"|'

	argparse-manpage --pyfile py/mock-hermetic-repo.py --function _argparser >docs/mock-hermetic-repo.1

	python    -m compileall py/ -q
	python -O -m compileall py/ -q

	popd >/dev/null
}

package() {
	cd "$pkgname-$pkgver"

	pushd mock >/dev/null

	mkdir -p "$pkgdir/$_bindir"
	install -Dp -m755 py/mock.py "$pkgdir/$_bindir"/mock.py
	install -Dp -m755 mockchain  "$pkgdir/$_bindir"/mockchain
	install -Dp -m755 py/mock-parse-buildlog.py "$pkgdir/$_bindir"/mock-parse-buildlog

	mkdir -p "$pkgdir/$_sysconfdir"/pam.d
	cp -Rp etc/pam/* "$pkgdir/$_sysconfdir"/pam.d/

	mkdir -p "$pkgdir/$_sysconfdir"/mock
	cp -Rp etc/mock/* "$pkgdir/$_sysconfdir"/mock/
	cp -p ../mock-core-configs/etc/mock/site-defaults.cfg "$pkgdir/$_sysconfdir"/mock/

	mkdir -p "$pkgdir/$_datadir"/polkit-1/{actions,rules.d}
	cp -p etc/polkit/org.rpm.mock.policy "$pkgdir/$_datadir"/polkit-1/actions/
	cp -p etc/polkit/org.rpm.mock.rules "$pkgdir/$_datadir"/polkit-1/rules.d/
	install -Dp -m755 etc/polkit/mock-pkexec.sh "$pkgdir/$_bindir"/mock

	mkdir -p "$pkgdir/$_datadir"/bash-completion/completions
	cp -Rp etc/bash_completion.d/* "$pkgdir/$_datadir"/bash-completion/completions/
	ln -s mock "$pkgdir/$_datadir"/bash-completion/completions/mock-parse-buildlog

	mkdir -p "$pkgdir/$_sysconfdir"/pki/mock
	cp -Rp etc/pki/* "$pkgdir/$_sysconfdir"/pki/mock/

	python_sitelib=$(python -c 'from sysconfig import get_path; import sys; sys.stdout.write(get_path(name="purelib"))')
	mkdir -p "$pkgdir/$python_sitelib"
	cp -Rp py/mockbuild "$pkgdir/$python_sitelib"/

	mkdir -p "$pkgdir/$_mandir"/man1
	cp -Rp docs/mock{,-hermetic-repo,-parse-buildlog}.1 "$pkgdir/$_mandir"/man1/

	install -Dp -m644 docs/site-defaults.cfg "$pkgdir/$_docdir"/site-defaults.cfg
	install -Dp -m644 docs/mock.cheat "$pkgdir/$_docdir"/cheat/mock

	popd >/dev/null

	install -Dp -m644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dp -m644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim: set ft=sh ts=4 sw=4 noet:
