# Maintainer: Khaled Rouissi <your.email@example.com>

pkgname=ma7rath
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, elegant command-line timer application"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/khalidrouissi1/ma7rath"
license=('MIT')
depends=()
makedepends=('go>=1.16')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Create LICENSE file if it doesn't exist
  if [ ! -f LICENSE ]; then
    cat > LICENSE << "EOF"
MIT License

Copyright (c) 2024 Khaled Rouissi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
  fi

  # Create README.md file if it doesn't exist
  if [ ! -f README.md ]; then
    cat > README.md << "EOF"
# Ma7rath

A simple, elegant command-line timer application built with Go.

## Usage

```bash
# Start a timer for 25 minutes
ma7rath 25

# Start a timer for 5 minutes and 30 seconds
ma7rath 5.5
```

## Controls

- Press 'q' to quit the application at any time
EOF
  fi
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}" -ldflags "-s -w" .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
