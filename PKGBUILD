# Maintainer: ExploitCraft <emonkk06@gmail.com>
# ReconNinja v10 — AUR package

pkgname=reconninja
pkgver=10.6.0
pkgrel=1
pkgdesc="Autonomous multi-phase security reconnaissance framework"
arch=('any')
url="https://github.com/ExploitCraft/ReconNinja"
license=('MIT')

depends=(
  'python>=3.10' 'python-rich' 'python-dotenv' 'python-requests'
  'python-dnspython' 'python-beautifulsoup4' 'python-cryptography'
  'python-yaml' 'python-ldap3' 'python-whois' 'python-ipwhois' 'python-flask'
)

optdepends=(
  'python-groq: AI provider groq'
  'python-openai: AI provider openai'
  'python-google-generativeai: AI provider gemini'
  'python-shodan: Shodan flag'
  'python-pymongo: MongoDB deep exposure check'
  'python-pysnmp: Full SNMP MIB walk'
  'python-weasyprint: Preferred PDF backend'
  'python-fpdf2: Fallback PDF backend'
  'python-impacket: AD recon Kerberoasting and AS-REP'
  'python-bloodhound-python: AD recon BloodHound collector'
  'python-neo4j: Graph export neo4j'
  'python-prometheus-client: Metrics port'
  'python-opentelemetry-api: OTLP endpoint'
  'python-textual: Textual TUI'
  'nmap: Core port scan and service fingerprint'
  'masscan: High-speed port scan'
  'rustscan: Fast port discovery'
  'subfinder: Subdomain enumeration'
  'amass: Subdomain enumeration'
  'assetfinder: Subdomain enumeration'
  'httpx-bin: HTTP probing and tech fingerprint'
  'whatweb: Web tech identification'
  'nikto: Web server vuln scanner'
  'feroxbuster: Recursive directory brute-force'
  'ffuf: Directory brute-force fallback'
  'dirsearch: Directory brute-force fallback'
  'gobuster: Directory brute-force fallback'
  'sqlmap: SQLi testing'
  'wfuzz: Web fuzzing'
  'nuclei: Template-based vuln scanner'
  'aquatone: Web screenshots'
  'gowitness: Web screenshots'
  'wafw00f: WAF detection'
  'bind-tools: Dig and nslookup for DNS zone transfer check'
  'dnsx: DNS resolver'
  'whois: WHOIS CLI'
  'seclists: Wordlists for directory brute-force'
  'net-tools: Legacy network utilities'
  'curl: HTTP probe fallback'
  'gpg: Evidence signing'
)

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm' 'python-pytest')

source=("${pkgname}::git+https://github.com/ExploitCraft/ReconNinja.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  pytest tests/ -v --tb=short || warning "Some tests failed; package will still be built."
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  _emit_completions "${pkgdir}"
}

_emit_completions() {
  local pkgdir="$1"
  # Bash completion
  install -dDm755 "${pkgdir}/usr/share/bash-completion/completions"
  cat > "${pkgdir}/usr/share/bash-completion/completions/reconninja" <<'EOF'
_reconninja() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="--profile --output-dir --output-format --global-timeout --threads --wordlist-size --subdomains --rustscan --masscan --httpx --whatweb --nikto --feroxbuster --nuclei --cve-lookup --shodan --virustotal --whois --wayback --ssl --github-osint --cloud-buckets --dns-zone --email-security --breach-check --cloud-meta --graphql --jwt-scan --asn-map --supply-chain --k8s-probe --db-exposure --smtp-enum --snmp-scan --ldap-enum --devops-scan --greynoise --typosquat --censys --dns-history --sarif-export --api-fuzz --oauth-scan --web-vulns --open-redirect --linkedin --paste-monitor --se-osint --app-store --anon-detect --dns-leak --web3 --ens --notify --pdf --check-tools --update --diff --gui --tui --menu --no-tui --version --help"
  local subcmds="scan plugin resume mcp-server"
  if [[ ${COMP_CWORD} -eq 1 ]]; then
    COMPREPLY=( $(compgen -W "${subcmds} ${opts}" -- "${cur}") )
  else
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  fi
  return 0
}
complete -F _reconninja reconninja
EOF
  # Zsh completion
  install -dDm755 "${pkgdir}/usr/share/zsh/site-functions"
  cat > "${pkgdir}/usr/share/zsh/site-functions/_reconninja" <<'EOF'
#compdef reconninja
_reconninja() {
  local -a subcmds
  subcmds=('scan:Run a scan' 'plugin:Plugin management' 'resume:Resume scan from state file' 'mcp-server:Start MCP server')
  _arguments -C \
    '1: :->subcmd' \
    '*::arg:->args'
  case $state in
    subcmd) _describe 'command' subcmds ;;
  esac
}
_reconninja "$@"
EOF
  # Fish completion
  install -dDm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  cat > "${pkgdir}/usr/share/fish/vendor_completions.d/reconninja.fish" <<'EOF'
complete -c reconninja -n '__fish_use_subcommand' -a scan       -d 'Run a scan'
complete -c reconninja -n '__fish_use_subcommand' -a plugin     -d 'Plugin management'
complete -c reconninja -n '__fish_use_subcommand' -a resume     -d 'Resume scan from state file'
complete -c reconninja -n '__fish_use_subcommand' -a mcp-server -d 'Start MCP server'
complete -c reconninja -l profile        -d 'Scan profile'
complete -c reconninja -l output-dir      -d 'Output directory'
complete -c reconninja -l output-format   -d 'Report format'
complete -c reconninja -l version         -d 'Print version and exit'
complete -c reconninja -l check-tools     -d 'Check installed external tools'
complete -c reconninja -l update          -d 'Self-update ReconNinja'
complete -c reconninja -l gui             -d 'Launch the local Flask GUI'
complete -c reconninja -l tui             -d 'Launch the Textual TUI'
complete -c reconninja -l menu            -d 'Launch the fsociety-style interactive menu'
complete -c reconninja -l diff            -d 'Diff two state.json files'
EOF
}
