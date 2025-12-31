# Maintainer: taotieren <admin@taotieren.com>

pkgname=resd-mini
pkgver=3.1.3
pkgrel=1
pkgdesc="This is the mini version of a high-value, high-performance and diverse resource downloader called res-downloader."
arch=($CARCH)
url="https://github.com/putyy/resd-mini"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
# replaces=(${pkgname})
depends=(
    glibc
    hicolor-icon-theme
)
makedepends=(
    pnpm
    git
    go
)
optdepends=(
    'motrix: A full-featured download manager (release version)'
    'gopeed-bin: High speed downloader that supports all platforms.(Prebuilt version)'
    'res-downloader: This is a high-value and high-performance and diverse resource downloader called res-downloader'
)
backup=()
options=(!debug !strip !lto)
install=${pkgname}.install
source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    ${pkgname}.install)
sha256sums=('b64fd88871ef9b61f7f6adab9a37063b57f367faebc8f314c060f7add364e562'
            '46feddf76850fb1a3991f8f82e5ee738b28070e34339e02dbc1f52c83dea5a73')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/web"
    sed -i '/"@vue\/devtools-kit"/d' package.json

    cat > vite.config.ts << 'EOF'
import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import { fileURLToPath, URL } from 'node:url';

const isNode = typeof process !== 'undefined' && process.versions?.node;

if (isNode && typeof window === 'undefined') {
  const mockStorage = {
    getItem: () => null,
    setItem: () => {},
    removeItem: () => {},
    clear: () => {},
    key: () => null,
    length: 0
  };
  
  (global as any).localStorage = mockStorage;
  (global as any).sessionStorage = mockStorage;
}

export default defineConfig({
  plugins: [vue({
    template: {
      compilerOptions: {
        isCustomElement: (tag: string) => tag.startsWith('media-')
      }
    }
  })],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  server: { port: 3000 },
  build: {
    rollupOptions: {
      output: {
        manualChunks: {
          vue: ['vue'],
          vendor: ['vue-router', 'pinia']
        }
      }
    }
  }
});
EOF

    cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "preserve",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src/**/*.ts", "src/**/*.d.ts", "src/**/*.tsx", "src/**/*.vue"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
EOF

    cat > tsconfig.node.json << 'EOF'
{
  "compilerOptions": {
    "composite": true,
    "skipLibCheck": true,
    "module": "ESNext",
    "moduleResolution": "bundler",
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "types": ["node"]
  },
  "include": ["vite.config.ts"]
}
EOF
    rm -rf node_modules pnpm-lock.yaml
}

build() {
    cd "${srcdir}/${pkgname}/"


    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    pushd web 
    export CARGO_HOME="${srcdir}/.cargo"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >>.npmrc

export VITE_DEVTOOLS=false
export NODE_ENV=production
    # NODE_ENV=development pnpm install --force
    # NODE_ENV=production pnpm run build 
    pnpm install --force
    pnpm run build-only
    popd
    #     wails build
    go build -o ${pkgname}
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -Dvm755 ${pkgname} -t ${pkgdir}/usr/bin
    install -Dvm644 web/src/assets/image/logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    #     install -Dvm644 build/linux/Arch/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Type=Application
Name=${pkgname}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}.png
Terminal=false
Categories=Utility

EOF
}
