# Maintainer: Fabian Leditzky <spookfish@ldsoft.dev>
# Maintainer: Sven Rueß <github@sven-ruess.de>

# Parts of this PKGBUILD are based on the PKGBUILD for extra/salt

# NOTES:
#  - Set env var SALT_ADDITIONAL_PIP_PACKAGES for additional onedir pip packages.
#    Example: SALT_ADDITIONAL_PIP_PACKAGES='gitpython pynacl' makepkg
#    The additional packages are listed in the package description.
#  - makepkg will complain about packaging issues because the .pyc files (python bytecode)
#    contain the absolute path of the resource during the build, meaning $srcdir references
#    are found in the final build. This does not appear to cause any real issues.
#

pkgname=salt-onedir
provides=('salt')
pkgver=3007.14
pkgrel=1
pkgdesc="Central system and configuration manager (onedir installation +[${SALT_ADDITIONAL_PIP_PACKAGES}])"
arch=('x86_64' 'aarch64')
url='https://saltproject.io'
license=('Apache-2.0')
replaces=('salt-zmq' 'salt-raet')
conflicts=('salt-zmq' 'salt-raet' 'salt')
depends=()
makedepends=('rsync')
optdepends=('dmidecode: decode SMBIOS/DMI tables')
backup=('etc/logrotate.d/salt'
        'etc/salt/master'
        'etc/salt/minion')

source_x86_64=("https://github.com/saltstack/salt/releases/download/v${pkgver}/salt-${pkgver}-onedir-linux-x86_64.tar.xz")
sha256sums_x86_64=('beb300b88759ce06c998e1bff119c4e65d637239de05c0bab354fcebd42295bd')

source_aarch64=("https://github.com/saltstack/salt/releases/download/v${pkgver}/salt-${pkgver}-onedir-linux-arm64.tar.xz")
sha256sums_aarch64=('b73682ad7051536cc60ac3e7a5979f8af5963b8f914190f1c9af8c74349b2bd0')

# The source tarball is downloaded because we need various files from pkg/common that are not included in the onedir tarball
source=("https://github.com/saltstack/salt/releases/download/v${pkgver}/salt-${pkgver}.tar.gz"
        salt.logrotate
        0000-services.patch)
sha256sums=('9fcc89154fab351d0a875661972b79f0555caa75f80efafa2d42885a7025f075'
            'abecc3c1be124c4afffaaeb3ba32b60dfee8ba6dc32189edfa2ad154ecb7a215'
            '6eb7d8840c40da7070167d3c742e7337c45f80d639fb7ef72f196fcaa2843469')


prepare() {
  # Extracted salt source tarball
  saltsrc="${srcdir}/salt-${pkgver}"
  cd "${saltsrc}"

  # patch services to run /opt/salt/bin/* binaries directly
  # not strictly required as we symlink into /usr/bin
  patch -Np1 -i ../0000-services.patch
}

build() {
  # Extracted salt-onedir tarball
  onedir="${srcdir}/salt"

  # Add additional python deps for Salt
  if [[ -n ${SALT_ADDITIONAL_PIP_PACKAGES} ]]; then
    "${onedir}"/bin/pip3 install ${SALT_ADDITIONAL_PIP_PACKAGES}
  fi
}

package() {
  # Extracted salt-onedir tarball
  onedir="${srcdir}/salt"
  # Extracted salt source tarball
  saltsrc="${srcdir}/salt-${pkgver}"

  # Copy over our onedir package
  mkdir "${pkgdir}"/opt
  rsync -a "${onedir}/" "${pkgdir}"/opt/salt

  # Create relative symlinks in /usr/bin for all relevant binaries
  # These will link into the /opt/salt/bin directory
  mkdir "${pkgdir}"/usr/bin -p
  for bin in "${pkgdir}"/opt/salt/{salt,spm}*; do
    ln -sr "${bin}" "${pkgdir}"/usr/bin
  done

  install -Dm644 salt.logrotate "$pkgdir"/etc/logrotate.d/salt

  # Install various files from the source tarball into the package
  cd "${saltsrc}"

  # default config
  install -v -Dm644 conf/master "$pkgdir/etc/salt/master"
  install -v -Dm644 conf/minion "$pkgdir/etc/salt/minion"

  # systemd services
  for _svc in salt-master.service salt-syndic.service salt-minion.service salt-api.service; do
    install -v -Dm644 pkg/common/$_svc "$pkgdir/usr/lib/systemd/system/$_svc"
  done

  # completions
  # For some reason there is no more pkg/common/salt.bash
  # The rpm one has the same content.
  install -v -Dm644 pkg/rpm/salt.bash "$pkgdir/usr/share/bash-completion/completions/salt"
  install -v -Dm644 pkg/common/salt.zsh "$pkgdir/usr/share/zsh/site-functions/_salt"
  install -v -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" pkg/common/fish-completions/*
}

# vim:set ts=2 sw=2 et:
