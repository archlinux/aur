# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Lahfa Samy (AkechiShiro) <'akechishiro-aur' at the domain 'lahfa.xyz'>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
pkgname=python-pwntools-git
pkgver=4.15.0.r144.g4c39ca92
pkgrel=1
pkgdesc='A CTF framework and exploit development library'
url='https://github.com/Gallopsled/pwntools'
arch=('any')
license=('BSD-2-Clause AND GPL-2.0-or-later AND GPL-3.0-or-later AND MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
)
conflicts=('python-pwntools')
depends=(
  'python'
  'python-capstone'
  'python-colored-traceback'
  'python-intervaltree'
  'python-mako'
  'python-packaging'
  'python-paramiko'
  'python-psutil'
  'python-pyelftools'
  'python-pygments'
  'python-pyserial'
  'python-pysocks'
  'python-requests'
  'python-rpyc'
  'python-sortedcontainers'
  'python-unicorn'
  'python-zstandard'
  'ropgadget'
)
optdepends=('gdb: binary debugging'
            'python-dateutil: Android build date fallback parsing')
source=("${pkgname}::git+https://github.com/Gallopsled/pwntools.git#branch=dev")
sha256sums=('SKIP')
provides=('python-pwntools')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${pkgname}
  python -m installer --destdir=test_dir dist/*.whl

  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" PWNLIB_NOTERM=true python -c 'import pwn'
}

package() {
  cd ${pkgname}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  find "${pkgdir}/usr/bin" -type f ! -name pwn -delete

  install -Dm 644 LICENSE-pwntools.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm 644 extra/bash_completion.d/pwn -t  "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 644 extra/zsh_completion/_pwn -t "${pkgdir}/usr/share/zsh/site-functions/"

  install -Dm 644 LICENSE-pwntools.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
