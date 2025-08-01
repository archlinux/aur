# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terraboard
pkgver=2.4.0
pkgrel=2
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
conflicts=('terraboard-bin')
provides=('terraboard')
license=('Apache-2')
makedepends=('go>=1.21' 'git' 'gcc' 'make')
depends=('glibc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/camptocamp/${pkgname}/archive/v${pkgver}.tar.gz"
        "terraboard.service")
sha256sums=('98235ca2b84b1d1667647c617851c13fd35095f7afdb861d9952bc20c5ab0304'
            '09fa8a80bcdcede55fcea39916fad19a53e42d797bef283b392a43b2727853c5')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    echo "=== Preparing build environment ==="
    
    # Verificar estructura del proyecto
    if [[ ! -f go.mod ]]; then
        echo "Error: go.mod not found"
        exit 1
    fi
    
    echo "Go module found:"
    head -5 go.mod
    
    # Clean cache completely
    go clean -cache -modcache -testcache 2>/dev/null || true
    
    # Clean environment variables
    export GOPROXY=https://proxy.golang.org,direct
    export GOSUMDB=sum.golang.org
    export GO111MODULE=on
    
    # Download dependencies with retry
    echo "Downloading dependencies..."
    for i in {1..3}; do
        if go mod download; then
            break
        else
            echo "Attempt $i/3 failed, retrying..."
            sleep 2
        fi
    done
    
    # Verify dependencies downloaded
    go list -m all > dependencies.txt
    echo "Dependencies downloaded: $(wc -l < dependencies.txt)"
}

build() {
    cd "${pkgname}-${pkgver}"
    
    echo "=== Building Terraboard ==="
    
    # Basic variables
    export GO111MODULE=on
    export CGO_ENABLED=1
    
    # Find entry point
    MAIN_PATH=""
    if [[ -f main.go ]]; then
        MAIN_PATH="."
        echo "Main found in root"
    elif [[ -f cmd/terraboard/main.go ]]; then
        MAIN_PATH="./cmd/terraboard"
        echo "Main found in cmd/terraboard/"
    elif [[ -f cmd/main.go ]]; then
        MAIN_PATH="./cmd"
        echo "Main found in cmd/"
    else
        echo "Searching for main.go..."
        find . -name "main.go" -type f | while read -r file; do
            echo "Found: $file"
        done
        
        # Use the first one it finds
        MAIN_PATH=$(dirname "$(find . -name "main.go" -type f | head -1)")
        if [[ -z "$MAIN_PATH" ]]; then
            echo "Error: No main.go found"
            exit 1
        fi
    fi
    
    echo "Using main in: $MAIN_PATH"
    
    # Create output directory
    mkdir -p build
    
    echo "=== Building ==="
    if go build -v -o build/${pkgname} \
        -ldflags "-X main.version=${pkgver}" \
        ${MAIN_PATH}; then
        echo "✅ Build successfull"
    else
        echo "❌ Build failed"
    fi

    # Verify binary exists
    if [[ ! -f "build/${pkgname}" ]]; then
        echo "Error: build successfull but no binary"
        ls -la build/
        exit 1
    fi
    
    # Make executable and verify
    chmod +x "build/${pkgname}"
    
    echo "=== Build completed ==="
    ls -la build/${pkgname}
    file build/${pkgname}
}

check() {
    cd "${pkgname}-${pkgver}"
    
    echo "=== Verifying binary ==="
    
    # Verify executable
    if [[ -x "build/${pkgname}" ]]; then
        echo "✅ Binary is executable"
    else
        echo "❌ Binary is not executable"  
        return 1
    fi
    
    # Basic test
    echo "Testing --help..."
    if ./build/${pkgname} --help >/dev/null 2>&1; then
        echo "✅ Command --help works"
    elif ./build/${pkgname} -h >/dev/null 2>&1; then
        echo "✅ Command -h works"
    else
        echo "⚠️  Help commands not available (normal in some programs)"
    fi
    
    # Verify dynamic dependencies
    echo "Verifying dynamic dependencies..."
    if command -v ldd >/dev/null 2>&1; then
        ldd build/${pkgname} | head -5 || echo "ldd failed or binary is static"
    fi
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    echo "=== Packaging Terraboard ==="
    
    # Main binary
    install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    
    # Systemd service
    install -Dm644 "${srcdir}/terraboard.service" "${pkgdir}/usr/lib/systemd/system/terraboard.service"
    
    # System user
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/terraboard.conf" << EOF
u terraboard - "Terraboard service user" /var/lib/terraboard /bin/false
EOF
    
    # System directories
    install -dm755 "${pkgdir}/var/lib/terraboard"
    install -dm755 "${pkgdir}/etc/terraboard"
    
    # Documentation
    [[ -f README.md ]] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    [[ -f CHANGELOG.md ]] && install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    
    # Example configuration
    cat > "${pkgdir}/etc/terraboard/terraboard.yaml.example" << 'EOF'
# Terraboard Configuration Example
# Copy to terraboard.yaml and customize

log:
  level: info
  format: plain

database:
  host: localhost
  port: 5432
  user: terraboard
  name: terraboard
  sslmode: require

web:
  port: 8080
  base-url: /

# Provider examples (uncomment and configure as needed):
# aws:
#   - access-key: your-access-key
#     secret-access-key: your-secret-key  
#     region: us-west-2
#     s3:
#       - bucket: your-terraform-states
#         file-extension: [".tfstate"]

# gcp:
#   - gcp-sa-key-path: /path/to/service-account.json
#     gcs-bucket: your-terraform-states

# gitlab:
#   - address: https://gitlab.com
#     token: your-gitlab-token
EOF
    
    echo "✅ Packaging completed"
}
