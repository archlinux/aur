# Maintainer: Charlie Wolf <charlie@wolf.is>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Christer Edwards <christer.edwards@gmail.com>
# Contributor: zer0def <zer0def@github>

_venv_base=/var/lib/salt/venv
pkgname=salt-venv
pkgver=3006.23
pkgrel=4
pkgdesc='Central system and configuration manager - LTS version running in a Virtualenv with an older python as per the salt supported python guide'
arch=('any')
url='http://saltstack.org/'
license=('Apache')
replaces=('salt')
conflicts=('salt')
makedepends=('python310' 'patchelf' 'rsync')
backup=('etc/logrotate.d/salt'
        'etc/salt/master'
        'etc/salt/minion')
install=salt.install
source=("https://pypi.io/packages/source/s/salt/salt-$pkgver.tar.gz"
        salt.logrotate)
sha256sums=('89a53ef52bb484f910a4e666810b0d096f0ad42005a54ffd035036d003865e1c'
            'abecc3c1be124c4afffaaeb3ba32b60dfee8ba6dc32189edfa2ad154ecb7a215')

prepare() {
  cd salt-$pkgver
  sed -i '/^contextvars/d' requirements/base.txt

  # remove version requirements for pyzmq, there's no point in it
  # we only have one version and the "python_version <=> *" checks are discarded
  # so pyzmq<=20.0.0 ends up in the final requirements.txt
  echo -e '-r crypto.txt\n\npyzmq' > requirements/zeromq.txt
  true
}

build() {
true
}

# TODO: Missing salt-factories, pytest-tempdir
# check() {
# local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#   cd salt-$pkgver
#   python setup.py install --root="$PWD/tmp_install" --optimize=1
#   PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" py.test
# }

package() {
  python3.10 -m venv --copies $pkgdir${_venv_base}
  pacman -Ql python310|cut -c 10-|grep /usr/lib/python3.10|cut -c 10- > $srcdir/lib_list.txt
  rsync -lvpto --files-from $srcdir/lib_list.txt /usr/lib $pkgdir${_venv_base}/lib/
  cp /usr/lib/$(ldd $pkgdir${_venv_base}/bin/python|awk '{print $1}'|grep libpython) $pkgdir${_venv_base}/lib/
  patchelf --set-rpath "${_venv_base}/lib" $pkgdir${_venv_base}/bin/python3.10
  ln -sf python3.10 $pkgdir${_venv_base}/bin/python3
  ln -sf python3 $pkgdir${_venv_base}/bin/python
  $pkgdir${_venv_base}/bin/python3.10 salt-$pkgver/setup.py build
  
  install -Dm644 salt.logrotate "$pkgdir"/etc/logrotate.d/salt


  $pkgdir${_venv_base}/bin/pip install --upgrade setuptools
  $pkgdir${_venv_base}/bin/pip install cffi==2.0.0 cryptography==46.0.7 distro==1.9.0 Jinja2==3.1.6 looseversion==1.3.0 M2Crypto==0.47.0 MarkupSafe==3.0.3 msgpack==1.1.2 packaging==26.1 pycparser==3.0 PyYAML==6.0.3 pyzmq==27.1.0 tornado==6.1 requests>=2.32.5 msgpack>=1.0.0 msgpack>=1.0.0 jaraco.functools>=4.1.0 jaraco.context>=6.1.0 jaraco.text>=4.0.0 jmespath>=1.1.0 frozenlist>=1.3.0 croniter>=0.3.0,!=0.3.22 timelib>=0.2.5 psutil>=5.0.0
  $pkgdir${_venv_base}/bin/python3.10 salt-$pkgver/setup.py --salt-pidfile-dir="/run/salt" install  --skip-build
  rm $pkgdir${_venv_base}/pyvenv.cfg
  find $pkgdir${_venv_base} -type f -name '*.pyc' -exec rm {} \;
  find $pkgdir${_venv_base} -type f -print0 | xargs -0 sed -i "s~$pkgdir~~g"
  $pkgdir${_venv_base}/bin/python3.10 -m compileall $pkgdir${_venv_base}
  # default config
  cd salt-$pkgver
  install -v -Dm644 conf/master "$pkgdir/etc/salt/master"
  install -v -Dm644 conf/minion "$pkgdir/etc/salt/minion"
  mkdir -p $pkgdir/usr/bin
  for _bin in salt    salt-call   salt-cp   salt-master  salt-pip    salt-run  salt-syndic salt-api  salt-cloud  salt-key  salt-minion  salt-proxy spm  salt-ssh; do
      ln -s ${_venv_base}/bin/$_bin $pkgdir/usr/bin/$_bin
  done

  # systemd services
  for _svc in salt-master.service salt-syndic.service salt-minion.service salt-api.service; do
    install -v -Dm644 pkg/common/$_svc "$pkgdir/usr/lib/systemd/system/$_svc"
  done

  rm $pkgdir${_venv_base}/bin/pip*
  rm $pkgdir${_venv_base}/bin/activate*
  rm $pkgdir${_venv_base}/bin/Activate*

  install -v -Dm644 pkg/common/salt.zsh "$pkgdir/usr/share/zsh/site-functions/_salt"
  install -v -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" pkg/common/fish-completions/*
}

# vim:set ts=2 sw=2 et:
