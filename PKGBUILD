# Maintainer: Fabian Leditzky <spookfish@ldsoft.dev>

# Parts of this PKGBUILD are based on the PKGBUILD for extra/salt

# NOTES:
#  - Set env var SALT_ADDITIONAL_PIP_PACKAGES for additional onedir pip packages.
#    Example: SALT_ADDITIONAL_PIP_PACKAGES='gitpython pynacl' makepkg
#    The additional packages are listed in the package description.
#  - makepkg will complain about packaging issues because the .pyc files (python bytecode)
#    contain the absolute path of the resource during the build, meaning $srcdir references
#    are found in the final build. This does not appear to cause any real issues.
#
# Security notice: The package build process fetches resources not listed explicitly.
#  - Python dependencies included in the final package are fetched from pypi.
#  - The relenv distribution (binary) is fetched from the official saltstack repos.
#    https://repo.saltproject.io/relenv/0.16.0/build/3.10.14-x86_64-linux-gnu.tar.xz
#    This download is not verified!
#    Unfortunately, it appears relenv cannot be forced to use a manually downloaded
#    and validated distribution.
#

pkgname=salt-onedir
provides=('salt')
pkgver=3007.1
pkgrel=2
pkgdesc="Central system and configuration manager (onedir installation +[${SALT_ADDITIONAL_PIP_PACKAGES}])"
arch=('x86_64' 'aarch64')
url='http://saltstack.org/'
license=('Apache-2.0')
replaces=('salt-zmq' 'salt-raet')
conflicts=('salt-zmq' 'salt-raet' 'salt')
depends=()
makedepends=('python-pip' 'python-virtualenv' 'patchelf' 'rsync')
optdepends=('dmidecode: decode SMBIOS/DMI tables')
backup=('etc/logrotate.d/salt'
        'etc/salt/master'
        'etc/salt/minion')
source=("https://github.com/saltstack/salt/releases/download/v${pkgver}/salt-${pkgver}.tar.gz"
        salt.logrotate
        0000-services.patch
        0001-binexec.patch)
sha256sums=('b933ac4cb3e4b1118b46dada55c9cc6bdc6f0f94b4c92877aec44b25c6a28c9a'
            'abecc3c1be124c4afffaaeb3ba32b60dfee8ba6dc32189edfa2ad154ecb7a215'
            '7619465e571469e5a08cd507d3d49e0e003256d79a1ada61971edecad0149ea8'
            '76be22ab2cb8cace81db74dfdbb7320c2125dcdd90e7c0518a58f40dc4f9f054')

prepare() {
  cd "${srcdir}/salt-${pkgver}"
  # patch services to run /opt/salt/bin/* binaries directly
  # not strictly required as we symlink into /usr/bin
  patch -Np1 -i ../0000-services.patch
}

build() {
  # Directory in which the onedir package will be build
  onedir="${srcdir}/salt-onedir"
  # Directory in which the venv for relenv itself will live
  venvdir="${srcdir}/build-venv"
  # makepkg does not seem to clean those, hence repeated builds fail...
  [[ -d ${onedir} ]] && rm -rf "${onedir}"
  [[ -d ${venvdir} ]] && rm -rf "${venvdir}"
  # virutal env in which we will install relenv
  # this virutalenv is only required for the build process
  # not included in the package!
  virtualenv -p python3 "${venvdir}"
  source "${venvdir}"/bin/activate
  pip install relenv
  # fetch the relenv distribution
  # this unfortunately writes to ${HOME}/.local/relenv/build
  relenv fetch --python=3.10.15
  # create the relenv environment into which we will install Salt
  relenv create "${onedir}"
  deactivate

  # Install salt into the relenv environment
  # Note: This must be an absolute path, otherwise pip interprets it as pkg name
  "${onedir}"/bin/pip3 install "${srcdir}/salt-${pkgver}"
  # Add additional python deps for Salt
  if [[ -n ${SALT_ADDITIONAL_PIP_PACKAGES} ]]; then
    "${onedir}"/bin/pip3 install ${SALT_ADDITIONAL_PIP_PACKAGES}
  fi

  # Patch the relenv binaries because they use a relative path
  # The original works but looks terrible in the process tree
  cd "${onedir}"
  patch -Np1 -i "${srcdir}"/0001-binexec.patch
}

package() {
  # Copy over our onedir package
  mkdir "${pkgdir}"/opt
  rsync -a "${srcdir}"/salt-onedir/ "${pkgdir}"/opt/salt

  # Create relative symlinks in /usr/bin for all relevant binaries
  # These will link into the /opt/salt/bin directory
  mkdir "${pkgdir}"/usr/bin -p
  for bin in "${pkgdir}"/opt/salt/bin/{salt,spm}*; do
    ln -sr "${bin}" "${pkgdir}"/usr/bin
  done

  install -Dm644 salt.logrotate "$pkgdir"/etc/logrotate.d/salt

  cd salt-$pkgver

  # default config
  install -v -Dm644 conf/master "$pkgdir/etc/salt/master"
  install -v -Dm644 conf/minion "$pkgdir/etc/salt/minion"

  # systemd services
  for _svc in salt-master.service salt-syndic.service salt-minion.service salt-api.service; do
    install -v -Dm644 pkg/common/$_svc "$pkgdir/usr/lib/systemd/system/$_svc"
  done

  # completions
  install -v -Dm644 pkg/common/salt.bash "$pkgdir/usr/share/bash-completion/completions/salt"
  install -v -Dm644 pkg/common/salt.zsh "$pkgdir/usr/share/zsh/site-functions/_salt"
  install -v -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" pkg/common/fish-completions/*
}

# vim:set ts=2 sw=2 et:
