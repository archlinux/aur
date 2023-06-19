# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=pretix-venv
_pkgname=pretix
pkgver=4.20.1
pkgrel=1
pkgdesc="Ticket shop application for conferences, festivals, concerts, tech events, shows, exhibitions, workshops, barcamps, etc. (venv-version)"
arch=('any')
url="https://github.com/pretix/pretix"
license=('GPL')
depends=('python' 'postgresql' 'redis' 'nodejs')
makedeps=('python-pip')
backup=('etc/pretix/pretix.cfg')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "$_pkgname-web.service"
        "$_pkgname-worker.service"
        "$_pkgname-periodic.service"
        "$_pkgname-periodic.timer"
        "$_pkgname.sysusers"
        "$_pkgname.tmpfiles"
        "$_pkgname.cfg")
sha256sums=('cc20bf627c11aa34bafb41b54f0111174bc044bdbf27df57cc60589bdcc005c4'
            '3cfa382ea4295d2e6eca94acc4cf77b93811d9b9ecee3e549eb445f161adf3ed'
            'e22f39cf639d797e5c91401050a351754d502c4b179af8450e926679ea31b4c9'
            '8463729a99776fe56bf5331aae6c2f58683e03c2951810fdb46314bac159beaa'
            '83c48c5d35a05359b59bff5df90baedb82cb8c0bd8d4f80d8783fdc017d8ac3f'
            'e49d25f1a308331d56abe4a30db3593da4eb2a316118da46d8fa2e8dbc4569bc'
            '41d010ed86e8603ce9bfbb603ffdd274b243a3903e579fdb9300f90bc9e87c0b'
            '37597bd7d2bbd9c1c34317043d88eb61278b7f8d72bc544a6f51457c2cd41f32')

package() {
  cd $_pkgname-$pkgver
  export PIP_DISABLE_PIP_VERSION_CHECK=1
  export PYTHONDONTWRITEBYTECODE=1
  install -dm0755 -o root "$pkgdir/var/pretix/venv"
  python3 -m venv "$pkgdir/var/pretix/venv"
  source "$pkgdir/var/pretix/venv/bin/activate"
  pip3 install wheel gunicorn
  pip3 install .  --compile
  find "$pkgdir"/var/pretix/venv/bin/ \
    -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
  find "$pkgdir"/var/pretix/venv/ \
    -type f -name "*.py[co]" -delete
  find "$pkgdir"/var/pretix/venv/ \
    -type d -name "__pycache__" -delete
  deactivate
  cd $srcdir
  install -Dm644 "$_pkgname"{-web,-worker,-periodic}.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$_pkgname-periodic.timer" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm600 "$_pkgname.cfg"   "$pkgdir/etc/$_pkgname/$_pkgname.cfg"
  install -Dm644 "$_pkgname.sysusers"   "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.tmpfiles"   "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}

# vim:set ts=2 sw=2 et:
