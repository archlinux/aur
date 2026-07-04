# Maintainer  : Yurii Kolesnykov <root@yurikoles.com>
# Contributor : Daniel Mach (dmach)
#
# Based on upstream: https://build.opensuse.org/projects/openSUSE:Factory/packages/osc/files/PKGBUILD
# Pull requests are welcome here: https://github.com/yurikoles-aur/osc

pkgname=osc
pkgver=1.27.2
pkgrel=1
pkgdesc="Command-line client for the Open Build Service"
arch=('any')
url="https://www.github.com/openSUSE/osc"
license=('GPL-2.0-or-later')
groups=('base-devel')
depends=('python-cryptography' 'python-ruamel-yaml' 'python-urllib3')
makedepends=('python>=3.6' 'python-argparse-manpage' 'python-setuptools' 'python-sphinx')
checkdepends=('diffstat' 'git' 'nano' 'python-yaml' 'vim')
optdepends=('build: osc build support'
            'ca-certificates: CA certificates'
            'diffstat: diffstat support'
            'git: git integration'
            'git-lfs: git integration'
            'obs-scm-bridge: git integration'
            'obs-service-recompress: recompress source files'
            'obs-service-download_files: download source files'
            'obs-service-format_spec_file: reformat spec files to SUSE standard'
            'obs-service-set_version: update version string in RPM spec or Debian changelog'
            'obs-service-source_validator: validate package sources'
            'obs-service-tar_scm: fetch sources from version control repos'
            'openssh: ssh authentication support'
            'python-argcomplete: git-obs completions support'
            'python-progressbar: download progress bar support'
            'python-distro: support for setting the default editor'
            'python-keyring: keyring support'
            'python-zstandard: support for opening control.tar.zst in debquery'
            'xdg-utils: osc browse support')
source=($pkgname-$pkgver.tar.gz::https://www.github.com/openSUSE/osc/archive/$pkgver.tar.gz)
sha256sums=('0b4da761f3788a6f457955d7ff62aad4c49facccfe93be1cde5b6f61f70acb0d')

build() {
  cd "$pkgname-$pkgver"

  # build docs
  PYTHONPATH=. argparse-manpage \
    --output=osc.1 \
    --format=single-commands-section \
    --module=osc.commandline \
    --function=argparse_manpage_get_parser \
    --project-name=osc \
    --prog=osc \
    --description="Command-line client for Open Build Service" \
    --author="Contributors to the osc project. See the project's GIT history for the complete list." \
    --url="https://github.com/openSUSE/osc/"
  PYTHONPATH=. argparse-manpage \
    --output=git-obs.1 \
    --format=single-commands-section \
    --module=osc.commandline_git \
    --function=argparse_manpage_get_parser \
    --project-name=osc \
    --prog=git-obs \
    --description="Git based command-line client for Open Build Service" \
    --author="Contributors to the osc project. See the project's GIT history for the complete list." \
    --url="https://github.com/openSUSE/osc/"
  sphinx-build -b man doc .

  python setup.py build
}

package() {
  msg "Installing osc ..."
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  # install completions for osc
  install -Dm0755 contrib/osc.complete $pkgdir/usr/share/osc/complete
  install -Dm0644 contrib/complete.csh $pkgdir/etc/profile.d/osc.csh
  install -Dm0644 contrib/complete.sh $pkgdir/usr/share/bash-completion/completions/osc.bash
  install -Dm0644 contrib/osc.fish $pkgdir/usr/share/fish/vendor_completions.d/osc.fish
  install -Dm0644 contrib/osc.zsh $pkgdir/usr/share/zsh/site-functions/_osc

  # install completions for git-obs
  install -Dm0644 contrib/git-obs-complete.bash $pkgdir/usr/share/bash-completion/completions/git-obs.bash
  install -Dm0644 contrib/git-obs-complete.fish $pkgdir/usr/share/fish/vendor_completions.d/git-obs.fish
  install -Dm0644 contrib/git-obs-complete.zsh $pkgdir/usr/share/zsh/site-functions/_git-obs

  # install man page
  install -Dm0644 git-obs-metadata.1 $pkgdir/usr/share/man/man1/git-obs-metadata.1
  install -Dm0644 git-obs-quickstart.1 $pkgdir/usr/share/man/man1/git-obs-quickstart.1
  install -Dm0644 osc.1 $pkgdir/usr/share/man/man1/osc.1
  install -Dm0644 git-obs.1 $pkgdir/usr/share/man/man1/git-obs.1
  install -Dm0644 oscrc.5 $pkgdir/usr/share/man/man5/oscrc.5

  # inject argcomplete marker to the generated git-obs executable
  sed -i '3i # PYTHON_ARGCOMPLETE_OK' $pkgdir/usr/bin/git-obs

  # inject zsh compdef header so that it gets autoloaded
  sed -i '1i #compdef git-obs' $pkgdir/usr/share/zsh/site-functions/_git-obs
}

check() {
  cd "$pkgname-$pkgver"
  python -m unittest
}
