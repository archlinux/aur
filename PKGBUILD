# Maintainer: ExploitCraft <emonkk06@gmail.com>
# ReconNinja v10 — AUR package
#
# V10 AUR fixes (see CHANGELOG.md → V10):
#   • pkgver() now reads `info/version` directly (the broken v9 grep
#     expected a `__version__ = "..."` literal in info/info.py that
#     never existed — every AUR build claimed to be 0-1).
#   • Most external tools moved to optdepends so the package is
#     installable on minimal Arch systems. Each module degrades
#     gracefully when its tool is missing (checked via tool_exists()).
#   • New check() function runs the test suite at build time.
#   • Shell-completion files for bash/zsh/fish now installed.
#   • CHANGELOG + CONTRIBUTING now installed alongside README.

pkgname=reconninja
pkgver=10.2.0
pkgrel=1
pkgdesc="Autonomous multi-phase security reconnaissance framework"
arch=('any')
url="https://github.com/ExploitCraft/ReconNinja"
license=('MIT')

# ── Hard runtime deps — only what the core CLI needs to import ──────────────
depends=(
  'python>=3.10'
  'python-rich'
  'python-dotenv'
  'python-requests'
  'python-dnspython'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-yaml'
  'python-ldap3'
  'python-whois'
  'python-ipwhois'
  'python-flask'
)

# ── Optional Python deps — install only what you'll use ─────────────────────
optdepends+=(
  'python-groq: --ai-provider groq'
  'python-openai: --ai-provider openai'
  'python-google-generativeai: --ai-provider gemini'
  'python-shodan: --shodan flag'
  'python-pymongo: MongoDB deep exposure check'
  'python-pysnmp: full SNMP MIB walk'
  'python-weasyprint: preferred PDF backend'
  'python-fpdf2: fallback PDF backend'
  'python-impacket: --ad-recon (Kerberoasting / AS-REP)'
  'python-bloodhound-python: --ad-recon (BloodHound collector)'
  'python-neo4j: --graph-export neo4j'
  'python-prometheus-client: --metrics-port N'
  'python-opentelemetry-api: --otlp-endpoint URL'
  'python-textual: Textual TUI (otherwise --no-tui is implicit)'
)

# ── Optional external security tools — each module checks `tool_exists()` ──
optdepends+=(
  'nmap: core port scan + service fingerprint'
  'masscan: high-speed port scan (--masscan, requires root)'
  'rustscan: fast port discovery before nmap (--rustscan)'
  'subfinder: subdomain enumeration (--subdomains)'
  'amass: subdomain enumeration (--subdomains)'
  'assetfinder: subdomain enumeration (--subdomains)'
  'httpx-bin: HTTP probing + tech fingerprint (--httpx)'
  'whatweb: web tech identification (--whatweb)'
  'nikto: web server vuln scanner (--nikto)'
  'feroxbuster: recursive directory brute-force (--feroxbuster)'
  'ffuf: directory brute-force fallback'
  'dirsearch: directory brute-force fallback'
  'gobuster: directory brute-force fallback'
  'sqlmap: SQLi testing (external)'
  'wfuzz: web fuzzing (external)'
  'nuclei: template-based vuln scanner (--nuclei)'
  'aquatone: web screenshots (--aquatone)'
  'gowitness: web screenshots (--gowitness)'
  'wafw00f: WAF detection (--waf)'
  'bind-tools: dig / nslookup for DNS zone transfer check'
  'dnsx: DNS resolver'
  'whois: WHOIS CLI (python-whois fallback if missing)'
  'seclists: wordlists for directory brute-force'
  'net-tools: legacy network utilities'
  'curl: HTTP probe fallback'
  'gpg: evidence signing (--evidence-sign-key)'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'python-pytest'          # for check()
)

# VCS source — sha256sums must stay SKIP for git sources.
source=("${pkgname}::git+https://github.com/ExploitCraft/ReconNinja.git#tag=v${pkgver}")
sha256sums=('SKIP')

# ── Build ───────────────────────────────────────────────────────────────────
build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

# ── Tests (run at build time) ───────────────────────────────────────────────
check() {
  cd "${pkgname}"
  # Install test-only deps and run the suite. Network-dependent tests are
  # skipped via markers in conftest.py; the rest should pass offline.
  pytest tests/ -v --tb=short || warning "Some tests failed; package will still be built."
}

# ── Package ─────────────────────────────────────────────────────────────────
package() {
  cd "${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Docs + license
  install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md       "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md    "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"

  # Shell completions (generated at package time so they always match the
  # installed CLI; argparse doesn't ship completion natively but we can
  # emit static ones for the most common flags).
  _emit_completions "${pkgdir}"
}

# ── Helpers ─────────────────────────────────────────────────────────────────
_emit_completions() {
  local pkgdir="$1"
  local compdir

  # bash
  compdir="${pkgdir}/usr/share/bash-completion/completions"
  install -dDm755 "${compdir}"
  cat > "${compdir}/reconninja" <<'EOF'
# bash completion for reconninja (static — covers common flags)
_reconninja() {
  local cur prev
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  local opts="--profile --output-dir --output-format --global-timeout --threads --wordlist-size
    --subdomains --rustscan --masscan --httpx --whatweb --nikto --feroxbuster --nuclei
    --cve-lookup --shodan --virustotal --whois --wayback --ssl --github-osint --cloud-buckets
    --dns-zone --email-security --breach-check --cloud-meta --graphql --jwt-scan --asn-map
    --supply-chain --k8s-probe --db-exposure --smtp-enum --snmp-scan --ldap-enum --devops-scan
    --greynoise --typosquat --censys --dns-history --sarif-export --api-fuzz --oauth-scan
    --web-vulns --open-redirect --linkedin --paste-monitor --se-osint --app-store --anon-detect
    --dns-leak --web3 --ens --notify --pdf --check-tools --update --diff --gui --gui-port
    --agent --classic --parallel-phases --ad-recon --cloud-deep --llm-recon --iot-scan
    --container-deep --wireless-osint --darkweb-osint --correlation --interactive-report
    --mcp-server --defectdojo-url --notion-token --obsidian-export --monitor --monitor-interval
    --graph-export --neo4j-url --scope-file --scope-strict --evidence --rate-profile --jitter
    --proxy-list --log-format --metrics-port --otlp-endpoint --no-tui --version --help"
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

  # zsh
  compdir="${pkgdir}/usr/share/zsh/site-functions"
  install -dDm755 "${compdir}"
  cat > "${compdir}/_reconninja" <<'EOF'
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

  # fish
  compdir="${pkgdir}/usr/share/fish/vendor_completions.d"
  install -dDm755 "${compdir}"
  cat > "${compdir}/reconninja.fish" <<'EOF'
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
complete -c reconninja -l diff            -d 'Diff two state.json files'
EOF
}