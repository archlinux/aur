#!/usr/bin/env python3

import urllib.request
import xml.etree.ElementTree as ET

with urllib.request.urlopen('https://download.eclipse.org/oomph/epp/installer-index.xml') as f:
	tree = ET.parse(f)

latest_release = ""

root = tree.getroot()
for release in root.findall("installer"):
	os = release.get("os", "")
	if os != "linux":
		continue

	arch = release.get("bitness", "")
	if arch != "64":
		continue

	release_version = release.get("release", "")
	# Only consider versions in format 2025-06/R.
	# There are older versions with codenames (e.g. photon) which we don't want,
	# and pre-releases may end with e.g. /M2 which we also don't want.
	if release_version.endswith("/R") \
		and release_version.startswith("2") \
		and release_version > latest_release:
		latest_release = release_version

# Convert 2025-06/R to 2025.06
print(latest_release.split("/")[0].replace("-", "."))
