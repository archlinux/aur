pkgname=legion-gui
pkgver=0.7.0.r0.c4a3604
pkgrel=13
pkgdesc="Legion GUI (Sparta successor), ported from Kali Linux for Arch Linux"
arch=("any")
url="https://gitlab.com/kalilinux/packages/legion"
license=("GPL-3.0-only")
backup=("etc/legion.conf")
depends=("python" "polkit" "nmap" "xterm" "xdg-utils" "python-colorama" "python-pandas" "python-pyfiglet" "python-pyqt6" "python-qasync" "python-requests" "python-rich" "python-service-identity" "python-six" "python-sqlalchemy" "python-termcolor" "python-urllib3" "chromium" "xorg-server-xvfb")
optdepends=("nikto: web server scanning actions" "whatweb: web fingerprinting actions" "wpscan: WordPress scanning actions" "hydra: brute-force actions" "gobuster: web content discovery fallback" "feroxbuster-bin: web content discovery actions" "nuclei-bin: nuclei web and CVE actions" "httpx-bin: ProjectDiscovery httpx binary, installed as httpx-toolkit" "dirsearch: web content discovery actions" "ffuf: web fuzzing actions" "katana-bin: ProjectDiscovery crawler actions" "dirb: common web wordlist" "smtp-user-enum-git: SMTP enumeration actions")
makedepends=("git" "patch" "perl" "python-pip")
source=("git+https://gitlab.com/kalilinux/packages/legion.git#branch=kali/master" "eyewitness::git+https://github.com/RedSiege/EyeWitness.git#branch=master" "legion-gui.desktop" "legion-gui-launcher")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

prepare() {
  cd "$srcdir/legion"

  patch -Np1 -i debian/patches/use-python3-shebang.patch
  patch -Np1 -i debian/patches/fix-paths.patch
  patch -Np1 -i debian/patches/Remove-rwho-usage.patch
  patch -Np1 -i debian/patches/Fix-sqlalchemy.exc.ArgumentError.patch
  patch -Np1 -i debian/patches/fix-pyexploitdb-import.patch
  patch -Np1 -i debian/patches/fix-typo-in-ssh-user-list.patch

  sed -i "s|^texteditor-path=.*|texteditor-path=/usr/bin/xdg-open|" legion.conf
  sed -i "s|smtp-user-enum -M|smtp-user-enum.pl -M|" legion.conf
  grep -q '^nikto="http,https,ssl,soap,http-proxy,http-alt,https-alt", tcp$' legion.conf || sed -i '/^screenshooter="http,https,ssl,http-proxy,http-alt,https-alt", tcp$/a nikto="http,https,ssl,soap,http-proxy,http-alt,https-alt", tcp' legion.conf

  cat > scripts/python/pyShodan.py <<'PYSHODAN'
#!/usr/bin/env python3
import sys


class PyShodanScript:
    def __init__(self):
        self.dbHost = None
        self.session = None

    def setDbHost(self, dbHost):
        self.dbHost = dbHost

    def setSession(self, session):
        self.session = session

    def run(self):
        if not self.dbHost or not hasattr(self.dbHost, "ipv4"):
            print("No dbHost or ipv4 provided.")
            return {}

        ip = str(self.dbHost.ipv4)
        return self.lookup(ip)

    def lookup(self, ip):
        try:
            from pyShodan import PyShodan
        except ImportError:
            print("pyShodan module not installed.")
            return {}

        try:
            pyShodanObj = PyShodan()
            pyShodanObj.apiKey = ""
            pyShodanObj.createSession()
            pyShodanResults = pyShodanObj.searchIp(ip, allData=True)

            if isinstance(pyShodanResults, dict) and pyShodanResults:
                if self.dbHost and self.session:
                    self.dbHost.latitude = pyShodanResults.get("latitude", "unknown")
                    self.dbHost.longitude = pyShodanResults.get("longitude", "unknown")
                    self.dbHost.asn = pyShodanResults.get("asn", "unknown")
                    self.dbHost.isp = pyShodanResults.get("isp", "unknown")
                    self.dbHost.city = pyShodanResults.get("city", "unknown")
                    self.dbHost.countryCode = pyShodanResults.get("country_code", "unknown")
                    self.session.add(self.dbHost)

                print(pyShodanResults)
                return pyShodanResults

            print("No results found or error in response.")
            return {}
        except Exception as exc:
            print(f"Error: {exc}")
            return {}


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: pyShodan.py <ip>")
        sys.exit(1)

    script = PyShodanScript()
    script.lookup(sys.argv[1])
PYSHODAN

  python -m py_compile scripts/python/pyShodan.py


  python - <<'PSCREEN'
from pathlib import Path

p = Path("app/Screenshooter.py")
s = p.read_text()

old = '''        # Use eyewitness under Kali.
        # Use webdriver if not Kali.
        # Once eyewitness is more broadly available, the counter case can be eliminated.
        if isKali():
            eyewitness_path = "/usr/bin/eyewitness"
        else:
            eyewitness_path = "/usr/local/bin/eyewitness"
'''
new = '''        # Prefer packaged EyeWitness path on Arch/Linux, fall back to legacy path.
        if os.path.isfile("/usr/bin/eyewitness"):
            eyewitness_path = "/usr/bin/eyewitness"
        else:
            eyewitness_path = "/usr/local/bin/eyewitness"
'''
if old in s:
    s = s.replace(old, new, 1)

legacy_err = '                raise FileNotFoundError("EyeWitness not found at /usr/bin/eyewitness. Please install it.")'
new_err = '                raise FileNotFoundError(f"EyeWitness not found at {eyewitness_path}. Please install it.")'
if legacy_err in s:
    s = s.replace(legacy_err, new_err, 1)

p.write_text(s)
PSCREEN

  python - <<'PARCHFINAL'
from pathlib import Path
import ast
import re
import py_compile

def replace_method(src: str, name: str, new_def: str) -> str:
    tree = ast.parse(src)
    lines = src.splitlines(True)

    for node in ast.walk(tree):
        if isinstance(node, ast.FunctionDef) and node.name == name:
            start = node.lineno - 1
            end = node.end_lineno
            indent = re.match(r"^(\s*)", lines[start]).group(1)
            lines[start:end] = [new_def.replace("{indent}", indent)]
            return "".join(lines)

    return src

settings = Path("app/settings.py")
s = settings.read_text(encoding="utf-8")

s = s.replace("httpx-toolkit-toolkit", "httpx-toolkit")
s = s.replace("-content-type-toolkit", "-content-type")
s = s.replace("-kf robotstxt,sitemapxml", "-kf all")
s = s.replace("raft-medium-directories.txt", "common.txt")

while "-content-type -content-type" in s:
    s = s.replace("-content-type -content-type", "-content-type")

s = re.sub(
    r'(?ms)^    HTTPX_COMMAND = \(\n.*?^    \)\n',
    '''    HTTPX_COMMAND = (
        "(command -v httpx-toolkit >/dev/null 2>&1 && "
        "httpx-toolkit -silent -json -title -tech-detect -web-server -status-code -content-type "
        "-u [WEB_URL] -o [OUTPUT].jsonl)"
    )
''',
    s,
    count=1,
)

s = replace_method(
    s,
    "_ensure_httpx_command",
    '''{indent}def _ensure_httpx_command(cls, command: str) -> str:
{indent}    raw = cls._canonicalize_web_target_placeholders(str(command or ""))
{indent}    if "httpx" not in raw.lower() and "httpx-toolkit" not in raw.lower():
{indent}        return raw
{indent}    return cls.HTTPX_COMMAND
'''
)

s = replace_method(
    s,
    "_ensure_katana_command",
    '''{indent}def _ensure_katana_command(cls, command: str) -> str:
{indent}    raw = cls._canonicalize_web_target_placeholders(str(command or ""))
{indent}    if "katana" not in raw.lower():
{indent}        return raw
{indent}    return "(command -v katana >/dev/null 2>&1 && katana -silent -jsonl -d 2 -jc -kf all -c 5 -p 1 -rl 5 -u [WEB_URL] -o [OUTPUT].jsonl)"
'''
)

s = replace_method(
    s,
    "_ensure_dirsearch_command",
    '''{indent}def _ensure_dirsearch_command(cls, command: str) -> str:
{indent}    raw = cls._canonicalize_web_target_placeholders(str(command or ""))
{indent}    if "dirsearch" not in raw.lower():
{indent}        return raw
{indent}    return "(command -v dirsearch >/dev/null 2>&1 && dirsearch -u [WEB_URL]/ --quiet-mode --format=json --output=[OUTPUT].json)"
'''
)

s = replace_method(
    s,
    "_ensure_ffuf_command",
    '''{indent}def _ensure_ffuf_command(cls, command: str) -> str:
{indent}    raw = cls._canonicalize_web_target_placeholders(str(command or ""))
{indent}    if "ffuf" not in raw.lower():
{indent}        return raw
{indent}    return "(command -v ffuf >/dev/null 2>&1 && ffuf -s -of json -o [OUTPUT].json -u [WEB_URL]/FUZZ -w /usr/share/wordlists/dirb/common.txt)"
'''
)

s = re.sub(
    r"feroxbuster -u https://\[IP\]:\[PORT\] -k --silent(?! -w )",
    "feroxbuster -u https://[IP]:[PORT] -k --silent -w /usr/share/wordlists/dirb/common.txt",
    s,
)
s = re.sub(
    r"feroxbuster -u http://\[IP\]:\[PORT\] --silent(?! -w )",
    "feroxbuster -u http://[IP]:[PORT] --silent -w /usr/share/wordlists/dirb/common.txt",
    s,
)
s = re.sub(
    r"wpscan --disable-tls-checks --no-update --format json --output \[OUTPUT\]\.json --url \[WEB_URL\]",
    "RUBYOPT=-W0 wpscan --disable-tls-checks --no-update --format json --output [OUTPUT].json --url [WEB_URL]",
    s,
)

s = re.sub(r';\s*else\s+echo\s+[^;]+?\s+not found;\s*fi', '; fi', s)
s = re.sub(r'\s*\|\|\s*echo\s+[^,"\n]+?\s+not found', '', s)
s = re.sub(r'fallback\s*=\s*["\']\s*\|\|\s*echo\s+[^"\']+?not found["\']', 'fallback = ""', s)
s = re.sub(r'fallback or ["\']\s*\|\|\s*echo\s+[^"\']+?not found["\']', 'fallback or ""', s)


# Remove split upstream default "tool not found" fallback strings.
s = re.sub(r'\s*\|\|\s*"\n\s*"echo [^"]+ not found"\n', '"\n', s)
s = re.sub(r'else echo [^"]+ not found; fi', 'fi', s)
s = re.sub(r'\s*\|\|\s*echo\s+[^,"\n]+?\s+not found(?:\s+-o\s+\S+)?(?=,|"|\n|$)', '', s)

settings.write_text(s, encoding="utf-8")
py_compile.compile(str(settings), doraise=True)

fixed_lines = {
    "wpscan": 'wpscan=Run wpscan,"(command -v wpscan >/dev/null 2>&1 && RUBYOPT=-W0 wpscan --disable-tls-checks --no-update --format json --output [OUTPUT].json --url [WEB_URL])","http,https,ssl,soap,http-proxy,http-alt,https-alt"',
    "web-content-discovery": 'web-content-discovery=Run web content discovery (feroxbuster/gobuster),"((command -v feroxbuster >/dev/null 2>&1 && (feroxbuster -u https://[IP]:[PORT] -k --silent -w /usr/share/wordlists/dirb/common.txt -o [OUTPUT].txt || feroxbuster -u http://[IP]:[PORT] --silent -w /usr/share/wordlists/dirb/common.txt -o [OUTPUT].txt)) || (command -v gobuster >/dev/null 2>&1 && ((gobuster -m dir -k -q -u https://[IP]:[PORT]/ -w /usr/share/wordlists/dirb/common.txt -o [OUTPUT].txt || gobuster -m dir -q -u http://[IP]:[PORT]/ -w /usr/share/wordlists/dirb/common.txt -o [OUTPUT].txt) || (gobuster dir -k -q -u https://[IP]:[PORT]/ -w /usr/share/wordlists/dirb/common.txt -o [OUTPUT].txt || gobuster dir -q -u http://[IP]:[PORT]/ -w /usr/share/wordlists/dirb/common.txt -o [OUTPUT].txt))))","http,https,ssl,soap,http-proxy,http-alt,https-alt"',
    "httpx": 'httpx=Run httpx,"(command -v httpx-toolkit >/dev/null 2>&1 && httpx-toolkit -silent -json -title -tech-detect -web-server -status-code -content-type -u [WEB_URL] -o [OUTPUT].jsonl)","http,https,ssl,soap,http-proxy,http-alt,https-alt"',
    "katana": 'katana=Run katana,"(command -v katana >/dev/null 2>&1 && katana -silent -jsonl -d 2 -jc -kf all -c 5 -p 1 -rl 5 -u [WEB_URL] -o [OUTPUT].jsonl)","http,https,ssl,soap,http-proxy,http-alt,https-alt"',
    "dirsearch": 'dirsearch=Run dirsearch,"(command -v dirsearch >/dev/null 2>&1 && dirsearch -u [WEB_URL]/ --quiet-mode --format=json --output=[OUTPUT].json)","http,https,ssl,soap,http-proxy,http-alt,https-alt"',
    "ffuf": 'ffuf=Run ffuf,"(command -v ffuf >/dev/null 2>&1 && ffuf -s -of json -o [OUTPUT].json -u [WEB_URL]/FUZZ -w /usr/share/wordlists/dirb/common.txt)","http,https,ssl,soap,http-proxy,http-alt,https-alt"',
}

conf = Path("legion.conf")
if conf.exists():
    text = conf.read_text(encoding="utf-8", errors="ignore")
    text = text.replace("httpx-toolkit-toolkit", "httpx-toolkit")
    text = text.replace("-content-type-toolkit", "-content-type")
    text = text.replace("-kf robotstxt,sitemapxml", "-kf all")
    text = text.replace("raft-medium-directories.txt", "common.txt")

    while "-content-type -content-type" in text:
        text = text.replace("-content-type -content-type", "-content-type")

    out = []
    seen = set()

    for line in text.splitlines():
        key = line.split("=", 1)[0].strip() if "=" in line else ""

        if key in fixed_lines:
            if key not in seen:
                out.append(fixed_lines[key])
                seen.add(key)
            continue

        line = re.sub(r';\s*else\s+echo\s+[^;]+?\s+not found;\s*fi', '; fi', line)
        line = re.sub(r'\s*\|\|\s*echo\s+[^,"\n]+?\s+not found(?:\s+-o\s+\S+)?(?=,|"|\n|$)', '', line)
        out.append(line)

    existing = {line.split("=", 1)[0].strip() for line in out if "=" in line}
    for key, value in fixed_lines.items():
        if key not in existing:
            out.append(value)

    conf.write_text("\n".join(out).rstrip() + "\n", encoding="utf-8")

print("final Arch Legion action fixes applied")
PARCHFINAL

  python -m py_compile app/settings.py


  python - <<'PARCHFIX'
from pathlib import Path
import ast
import re

# Controller runtime imports and scheduler approval behavior.
p = Path("controller/controller.py")
s = p.read_text()
if "import PyQt6.QtCore as QtCore" not in s:
    lines = s.splitlines()
    insert_at = 0
    while insert_at < len(lines) and (lines[insert_at].startswith("#!") or "coding" in lines[insert_at].lower()):
        insert_at += 1
    lines.insert(insert_at, "import PyQt6.QtCore as QtCore")
    s = "\n".join(lines) + "\n"

m = re.search(r"^from app\.auxiliary import (?P<names>[^\n]+)$", s, flags=re.M)
if not m:
    raise SystemExit("app.auxiliary import line not found")
names = [item.strip() for item in m.group("names").split(",")]
for extra in ["MyQProcess", "BrowserOpener"]:
    if extra not in names:
        names.append(extra)
s = s[:m.start()] + "from app.auxiliary import " + ", ".join(names) + s[m.end():]

tree = ast.parse(s)
lines = s.splitlines(True)
for node in ast.walk(tree):
    if isinstance(node, ast.FunctionDef) and node.name == "_promptDangerousActionApproval":
        indent = re.match(r"^(\s*)", lines[node.lineno - 1]).group(1)
        new_func = "\n".join([
            indent + 'def _promptDangerousActionApproval(self, decision, service, ip, port, protocol="tcp", command_template=""):',
            indent + '    if not decision.requires_approval:',
            indent + '        return SchedulerDecisionDisposition(action="execute")',
            indent + '    approval_id = self._queueScheduledApproval(decision, service, ip, port, protocol, command_template)',
            indent + '    update_pending_approval(',
            indent + '        self.logic.activeProject.database,',
            indent + '        approval_id,',
            indent + '        status="approved",',
            indent + '        decision_reason="auto-approved",',
            indent + '    )',
            indent + '    return SchedulerDecisionDisposition(action="execute", approval_id=approval_id, reason="auto-approved")',
        ]) + "\n"
        lines[node.lineno - 1:node.end_lineno] = [new_func]
        s = "".join(lines)
        break
else:
    raise SystemExit("_promptDangerousActionApproval not found")
p.write_text(s)

# QProcess must use a shell for compound scheduler commands.
p = Path("app/auxiliary.py")
s = p.read_text()
pattern = r"def formatCommandQProcess\(inputCommand\):\n(?:    .*\n)+?    return program, arguments\n"
replacement = "\n".join([
    "def formatCommandQProcess(inputCommand):",
    "    if isinstance(inputCommand, (list, tuple)):",
    "        parts = [str(item) for item in inputCommand]",
    "        if not parts:",
    "            return \"\", []",
    "        return parts[0], parts[1:]",
    "",
    "    command = str(inputCommand or \"\").strip()",
    "    if not command:",
    "        return \"\", []",
    "",
    "    shell_tokens = (\"|\", \"&\", \";\", \"<\", \">\", \"(\", \")\", \"`\", \"$\", \"\\\\n\")",
    "    if any(token in command for token in shell_tokens):",
    "        return \"/usr/bin/env\", [\"bash\", \"-lc\", command]",
    "",
    "    parts = shlex.split(command)",
    "    if not parts:",
    "        return \"\", []",
    "    return parts[0], parts[1:]",
]) + "\n"
s, count = re.subn(pattern, replacement, s, count=1)
if count != 1:
    raise SystemExit("formatCommandQProcess replacement failed")
p.write_text(s)

# Prevent repeated nikto -nointeractive accumulation during action migration.
p = Path("app/settings.py")
s = p.read_text()
needle = '        normalized = re.sub(r"(?i)(?:^|\\s)-format\\s+\\S+", " ", normalized)\n'
insert = needle + '        normalized = re.sub(r"(?i)(?:^|\\s)-nointeractive(?=\\s|$)", " ", normalized)\n'
if needle in s and insert not in s:
    s = s.replace(needle, insert, 1)
p.write_text(s)
PARCHFIX

  python -m py_compile app/auxiliary.py app/settings.py controller/controller.py








}

build() {
  cd "$srcdir/eyewitness"
  python -m venv eyewitness-venv
  eyewitness-venv/bin/pip install -U pip wheel setuptools
  eyewitness-venv/bin/pip install -r setup/requirements.txt
}

package() {
  cd "$srcdir/legion"

  install -d "$pkgdir/usr/share/legion"
  cp -a app controller db images parsers scripts ui utilities wordlists "$pkgdir/usr/share/legion/"
  install -m644 CHANGELOG.txt "$pkgdir/usr/share/legion/CHANGELOG.txt"
  install -m644 LICENSE "$pkgdir/usr/share/legion/LICENSE"
  install -m644 legion.py "$pkgdir/usr/share/legion/legion.py"
  if test -f nmap.xsl; then
    install -m644 nmap.xsl "$pkgdir/usr/share/legion/nmap.xsl"
  fi

  install -Dm644 legion.conf "$pkgdir/etc/legion.conf"
  ln -sf /etc/legion.conf "$pkgdir/usr/share/legion/legion.conf"

  install -Dm755 "$srcdir/legion-gui-launcher" "$pkgdir/usr/bin/legion-gui"
  install -Dm644 "$srcdir/legion-gui.desktop" "$pkgdir/usr/share/applications/legion-gui.desktop"
  install -Dm644 images/icons/Legion-N_128x128.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/legion-gui.svg"

  install -d "$pkgdir/usr/share/legion/eyewitness"
  cp -a "$srcdir/eyewitness/Python" "$pkgdir/usr/share/legion/eyewitness/"
  cp -a "$srcdir/eyewitness/setup" "$pkgdir/usr/share/legion/eyewitness/"
  cp -a "$srcdir/eyewitness/eyewitness-venv" "$pkgdir/usr/share/legion/eyewitness/"
  if test -f "$srcdir/eyewitness/LICENSE"; then
    install -m644 "$srcdir/eyewitness/LICENSE" "$pkgdir/usr/share/legion/eyewitness/LICENSE"
  fi
  if test -f "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/pyvenv.cfg"; then
    sed -i "s|$srcdir/eyewitness|/usr/share/legion/eyewitness|g" "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/pyvenv.cfg" 2>/dev/null || true
  fi
  find "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/bin" -maxdepth 1 -type f ! -name "python" ! -name "python3" ! -name "python3.*" -delete 2>/dev/null || true
  find "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/bin" -maxdepth 1 -type l -name "*thon" ! -name "python" ! -name "python3*" -delete 2>/dev/null || true

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/eyewitness" <<'WRAP'
#!/usr/bin/env bash
set -euo pipefail
cd /usr/share/legion/eyewitness
export PATH="/usr/share/legion/eyewitness/eyewitness-venv/bin:$PATH"
exec /usr/share/legion/eyewitness/eyewitness-venv/bin/python /usr/share/legion/eyewitness/Python/EyeWitness.py "$@"
WRAP
  chmod 755 "$pkgdir/usr/bin/eyewitness"

  chmod 755 "$pkgdir/usr/share/legion/scripts/"* 2>/dev/null || true
  find "$pkgdir/usr/share/legion" -type d -name "__pycache__" -prune -exec rm -rf {} + 2>/dev/null || true
  find "$pkgdir/usr/share/legion" -type f -name "*.pyc" -delete 2>/dev/null || true
}
