# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="rustpython-bootstrap"
pkgname=(
  "rustpython-build-bootstrap"
  "rustpython-flit-core-bootstrap"
  "rustpython-installer-bootstrap"
  "rustpython-packaging-bootstrap"
  "rustpython-pyproject-hooks-bootstrap"
  "rustpython-setuptools-bootstrap"
  "rustpython-wheel-bootstrap"
)
pkgver=3.14.0
pkgrel=1
arch=(
  'any'
)
url="https://gitlab.archlinux.org/archlinux/python-bootstrap"
license=(
  'MIT'
)
depends=(
  'rustpython'
)
makedepends=(
  'git'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=${pkgver}?signed"
  "python-build::git+https://github.com/pypa/build.git"
  "python-flit::git+https://github.com/takluyver/flit.git"
  "python-installer::git+https://github.com/pypa/installer.git"
  "python-wheel::git+https://github.com/pypa/wheel.git"
  "python-packaging::git+https://github.com/pypa/packaging.git"
  "python-pyproject-hooks::git+https://github.com/pypa/pyproject-hooks.git"
  "python-setuptools::git+https://github.com/pypa/setuptools.git"
)
sha256sums=('6b3b0f54e23c87be06c87ddfe304c32d595f5ce5e4b0f65dde0624ac35c520bb'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=(
  '991F6E3F0765CF6295888586139B09DA5BF0D338' # David Runge <dvzrv@archlinux.org>
  'E499C79F53C96A54E572FEE1C06086337C50773E' # Jelle van der Waa <jelle@vdwaa.nl>
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init

  git config submodule."external/build".url           "${srcdir}/python-build"
  git config submodule."external/flit".url            "${srcdir}/python-flit"
  git config submodule."external/installer".url       "${srcdir}/python-installer"
  git config submodule."external/wheel".url           "${srcdir}/python-wheel"
  git config submodule."external/packaging".url       "${srcdir}/python-packaging"
  git config submodule."external/pyproject-hooks".url "${srcdir}/python-pyproject-hooks"
  git config submodule."external/setuptools".url      "${srcdir}/python-setuptools"

  git -c protocol.file.allow=always submodule update
  git submodule update --init --recursive

  find . -type f -name '*.py' -exec \
    sed -i 's/python -m/rustpython -m/g' "{}" +
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.build
}

package_rustpython-build-bootstrap() {
  pkgdesc="A simple, correct PEP 517 build frontend (bootstrap)"
  # license=(
  #   'MIT'
  # )
  depends+=(
    'rustpython-packaging'
    'rustpython-pyproject-hooks'
  )
  provides=(
    "${pkgname%-bootstrap}"
  )
  conflicts=(
    "${pkgname%-bootstrap}"
  )

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.install dist/build-*-py3-none-any.whl -d "${pkgdir}"

  find "${pkgdir}/usr/bin" -type f -exec \
    mv -v "{}" "{}-rustpython" \;
}

package_rustpython-installer-bootstrap() {
  pkgdesc="Low-level library for installing a Python package from a wheel distribution (bootstrap)"
  # license=(
  #   'MIT'
  # )
  provides=(
    "${pkgname%-bootstrap}"
  )
  conflicts=(
    "${pkgname%-bootstrap}"
  )

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.install dist/installer-*-py3-none-any.whl -d "${pkgdir}"
}

package_rustpython-flit-core-bootstrap() {
  pkgdesc="Simplified packaging of Python modules (core backend) (bootstrap)"
  license=(
    'BSD-3-Clause'
  )
  provides=(
    "${pkgname%-bootstrap}"
  )
  conflicts=(
    "${pkgname%-bootstrap}"
  )

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.install dist/flit_core-*-py3-none-any.whl -d "${pkgdir}"
}

package_rustpython-wheel-bootstrap() {
  pkgdesc="A built-package format for Python (bootstrap)"
  # license=(
  #   'MIT'
  # )
  provides=(
    "${pkgname%-bootstrap}"
  )
  conflicts=(
    "${pkgname%-bootstrap}"
  )

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.install dist/wheel-*-py3-none-any.whl -d "${pkgdir}"

  find "${pkgdir}/usr/bin" -type f -exec \
    mv -v "{}" "{}-rustpython" \;
}

package_rustpython-packaging-bootstrap() {
  pkgdesc="Core utilities for Python packages (bootstrap)"
  license=(
    'Apache-2.0 OR BSD-2-Clause'
  )
  provides=(
    "${pkgname%-bootstrap}"
  )
  conflicts=(
    "${pkgname%-bootstrap}"
  )

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.install dist/packaging-*-py3-none-any.whl -d "${pkgdir}"
}

package_rustpython-pyproject-hooks-bootstrap() {
  pkgdesc="A low-level library for calling build-backends in pyproject.toml-based project (bootstrap)"
  # license=(
  #   'MIT'
  # )
  provides=(
    "${pkgname%-bootstrap}"
  )
  conflicts=(
    "${pkgname%-bootstrap}"
  )

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.install dist/pyproject_hooks-*-py3-none-any.whl -d "${pkgdir}"
}

package_rustpython-setuptools-bootstrap() {
  pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages (bootstrap)"
  # license=(
  #   'MIT'
  # )
  provides=(
    "${pkgname%-bootstrap}"
  )
  conflicts=(
    "${pkgname%-bootstrap}"
  )

  cd "${srcdir}/${_pkgsrc}"
  rustpython -m bootstrap.install dist/setuptools-*-py3-none-any.whl -d "${pkgdir}"
}
