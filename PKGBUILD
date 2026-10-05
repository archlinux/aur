# Maintainer: fuero <fuerob@gmail.com>
pkgname=(zot zli zb zxp zot-docs)
pkgbase=zot
# renovate: datasource=github-releases depName=project-zot/zot
pkgver=2.1.21
pkgrel=1
pkgdesc='A scale-out production-ready vendor-neutral OCI-native container image/artifact registry'
arch=('x86_64' 'aarch64')
url='https://github.com/project-zot/zot'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'npm')
source=(
  "${url}/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
  "${pkgbase}.service"
  "${pkgbase}.tmpfiles"
  "${pkgbase}.sysusers"
  "${pkgbase}.config"
  "trivy-dep.patch"
)
sha512sums=('e73ec7534756dffa7f6f64315317f268bf64e8373b024df37299a717c5b0c86177e75361cbe723330ffcda69d7e5d2ca2c28b0b4f59fb9315a02332c6b8f0e30'
            '6ec30ab646294fb80ab94553b1bb3f25aabc1487436922770e89ff9bd523bfb22a51a5d76b48b9f2fca24867fa8c2639f6d868fcd614aa83206294a14ceb6a4f'
            '84ac76bb0c1f9c8ac20985ff02e9bf8d8a7dcca2030501d4ba388edf34f30412c4692385734839829127e22fdc9e44d5ee00788da230c463d0cd1b71faa9d2bc'
            'd0d8d88d79fa7277d65670a3d5f01efe86b68ad7490a23066a0fb58cf3017aeff1f716ea4f6e5335a01609f2b60a679c8f5e26efec486e9c7b765e6d24cab532'
            'e5bdca56ed60c88dbd5013ba5c3bdbae21a733471dbdf8e0f4b7cacb00439e0d4f4a633726797d3c8106152e34edf7ce158f68cb6b3c79153a20f78f6db9e470'
            '53ad0e5b3daec226e0960e019ca641b00e2085c8da8d638a6166c1cc76d2844c2b03bd0799f1928abf3b6862727d95b40263eb974fa2cb0e0a09b0ba8ddd63f0')
b2sums=('ac088cf20e48bfe1255f6c10eea4692dbd89a52c83d0a43d771e511e586544ef7784b85199b0da37973c66b66ff4d0879da7661d6679a338acd4d8a613d2b364'
        'c28dd7b4162986fb5e827dc9c31c27208889b859fe149241aa323fafc14cd50231259864cf12dc8ff32cba4f9044671366ee5afe2ec9331de8eec9f49ff98033'
        '018ac527c0eba82b84fa30c9390969aac8b3e444f1d737b415eb521f6d5fe50ad8a46dcad972848da8d368d2525020bb8b9672881aeb9cf6880e92fabec39061'
        '3b13686c657dd70c80f48576a2647185bd399bb1c00177da3dd879439db2bc3af337577cc2d96befa769d32736359dee55da970d547e7f45fb97347b7af7a029'
        'bf748bacb72049ce9a551cc9572645db9e3fdb8d2ee7fc92388e4fc40146678132b418b53aa75e2adde08f7066b0a5ea85997d680170b07b481bc6cec979317f'
        'ba9a138d37eb78e3b7234772a9eb10f940f3b2097cdfaa9fc4ec96eb0bc889b02f81fd303a46afd0ba905a98462c5f16bc9346760ccfabdaa128e49597eb6e1b')

prepare() {
  cd "${pkgbase}-${pkgver}"
  patch -p0 < "${srcdir}/trivy-dep.patch"
  go mod tidy
}

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgbase}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
    date="$(date +%F)"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgbase}-${pkgver}"
  sed -i -e 's/CGO_ENABLED=0/CGO_ENABLED=1/g' Makefile
  make ui
  TAGS=sync,search,scrub,metrics,lint,ui,mgmt,profile,userprefs,imagetrust,events
  for i in ${pkgname[@]}
  do
    if [[ ${i} != zot-docs ]] && [[ ${i} != zxp ]] ; then
      env GOEXPERIMENT=jsonv2 go build -v \
        -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
        -tags "${TAGS}" \
        -o bin/ \
        "./cmd/${i}"
    elif [[ ${i} == zxp ]] ; then
      env GOEXPERIMENT=jsonv2 go build -v \
        -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
        -tags "${TAGS/,metrics}" \
        -o bin/ \
        "./cmd/${i}"
    fi
  done
}

check() {
  cd "${pkgbase}-${pkgver}"
  #go test -short ./...
}

__install() {
  install -Dm755 "bin/${1}" "${pkgdir}/usr/bin/${1}"
  "bin/${1}" completion bash \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${1}"
  "bin/${1}" completion zsh \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${1}"
  "bin/${1}" completion fish \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${1}.fish"
}

package_zli() {
  cd "${pkgbase}-${pkgver}"
  __install zli
}

package_zb() {
  cd "${pkgbase}-${pkgver}"
  __install zb
}

package_zxp() {
  cd "${pkgbase}-${pkgver}"
  __install zxp
}

package_zot-docs() {
  cd "${pkgbase}-${pkgver}"
  
  for i in *.md CODEOWNERS NOTICE
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgbase}"
  done
}

package_zot() {
  cd "${pkgbase}-${pkgver}"
  __install zot

  install -Dpm0644 ${srcdir}/${pkgbase}.service "${pkgdir}/usr/lib/systemd/system/${pkgbase}.service"
  install -Dpm0644 ${srcdir}/${pkgbase}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"
  install -Dpm0644 ${srcdir}/${pkgbase}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"
  install -dm750 "${pkgdir}/etc/${pkgbase}"
  install -m0640 ${srcdir}/${pkgbase}.config "${pkgdir}/etc/${pkgbase}/config.json"
}
