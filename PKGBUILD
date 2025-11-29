pkgname=lumus
pkgver=1.0.1
pkgrel=1
pkgdesc="A command line tool to read PDF files directly in the terminal"
arch=('x86_64')
url="https://github.com/Josehpequeno/lumus"
license=('MIT')
depends=('poppler' 'wv' 'unrtf' 'tidy' 'tesseract' 'leptonica' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Josehpequeno/lumus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
  # Detect automatically where the files are
  local build_dir
  if [ -f "lumus.go" ]; then
    # We are in the local directory (without extraction)
    build_dir="."
    echo "Local mode: using current directory"
  elif [ -d "$srcdir/$pkgname-$pkgver" ]; then
    # We are in AUR after extraction
    build_dir="$srcdir/$pkgname-$pkgver"
    echo "AUR mode: using $build_dir"
  else
    # Try to find any directory with the files
    build_dir=$(find "$srcdir" -name "lumus.go" -printf '%h\n' | head -1)
    if [ -n "$build_dir" ]; then
      echo "Auto mode: using $build_dir"
    else
      echo "ERROR: Could not find project files"
      echo "Content of srcdir:"
      ls -la "$srcdir"
      exit 1
    fi
  fi

  cd "$build_dir"
  
  echo "Building in: $(pwd)"
  echo "Available files:"
  ls -la
  
  # Go settings
  export CGO_ENABLED=0
  export GO111MODULE=on
  export GOPROXY=https://proxy.golang.org,direct

   # Remove go.mod existente se for muito antigo
  if [ -f "go.mod" ]; then
    echo "=== CONTEÚDO ATUAL DO go.mod ==="
    cat go.mod
    echo "================================"
    
    # Verifica se o go.mod tem a versão correta do gosseract
    if ! grep -q "github.com/otiai10/gosseract/v2" go.mod; then
      echo "Corrigindo dependência gosseract no go.mod..."
      # Remove dependências problemáticas
      go mod edit -droprequire=github.com/otiai10/gosseract
      # Adiciona a versão correta
      go get github.com/otiai10/gosseract/v2@latest
    fi
  else
    echo "Criando novo go.mod..."
    go mod init lumus
    go get github.com/otiai10/gosseract/v2@latest
  fi

  # FORÇA a versão correta do gosseract
  echo "Forçando versão correta do gosseract..."
  go mod edit -require=github.com/otiai10/gosseract/v2@v2.4.1
  go get github.com/otiai10/gosseract/v2@v2.4.1


  # Baixa dependências explicitamente
  echo "Baixando dependências..."
  go mod tidy
  go mod download

    # Verifica se a dependência correta foi baixada
  echo "=== DEPENDÊNCIAS INSTALADAS ==="
  go list -m all | grep gosseract
  echo "================================"

  # Build
  echo "Compiling..."
  go build -trimpath -ldflags="-s -w" -o lumus .
  
  # Check if the binary was created
  if [ -f "lumus" ]; then
    echo "Build completed successfully!"
  else
    echo "ERROR: Binary was not created"
    exit 1
  fi
}

package() {
  # Use the same logic as build to find the files
  local build_dir
  if [ -f "lumus.go" ]; then
    build_dir="."
  elif [ -d "$srcdir/$pkgname-$pkgver" ]; then
    build_dir="$srcdir/$pkgname-$pkgver"
  else
    build_dir=$(find "$srcdir" -name "lumus.go" -printf '%h\n' | head -1)
  fi

  cd "$build_dir"
  
  echo "Installing package from: $(pwd)"

  echo "=== VERIFICANDO GOSSERACT ==="
  go list -m -versions github.com/otiai10/gosseract/v2
  echo "============================="
  
  # ... resto do build
  
  # Install binary
  install -Dm755 lumus "$pkgdir/usr/bin/lumus"
  
  echo "Installation completed!"
}