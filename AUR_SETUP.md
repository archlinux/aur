# AUR Setup Guide

This guide walks you through setting up your Lem AUR package for publishing and automated updates.

## Step 1: Generate SSH Key for AUR

AUR requires SSH authentication. Generate a key if you don't have one:

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
```

This creates `~/.ssh/id_ed25519` and `~/.ssh/id_ed25519.pub`.

## Step 2: Add SSH Key to AUR Account

1. Log in to https://aur.archlinux.org
2. Go to **Account Settings**
3. Paste the contents of `~/.ssh/id_ed25519.pub` into the SSH Public Key field
4. Save

To view your public key:
```bash
cat ~/.ssh/id_ed25519.pub
```

## Step 3: Configure Git for AUR

Set your git user information (if not already done):

```bash
cd /home/thomas/lem-aur-build
git config user.name "Your Name"
git config user.email "your-email@example.com"
```

## Step 4: Initialize AUR Repository

You have two options depending on whether this is a new or existing package:

### Option A: New Package (First Time)

1. Initialize the repository locally:
```bash
cd /home/thomas/lem-aur-build
git init
git add PKGBUILD .SRCINFO
git commit -m "Initial commit: Lem nightly AppImage package"
```

2. Create the package on AUR:
   - Visit https://aur.archlinux.org/packages/new
   - Enter package name: `lem`
   - Click "Create"

3. Add the AUR remote:
```bash
git remote add aur ssh://aur@aur.archlinux.org/lem.git
```

4. Push to AUR:
```bash
git push -u aur main:master
```

Note: AUR uses `master` branch, not `main`.

### Option B: Adopting Existing Abandoned Package

If a `lem` package already exists on AUR but is unmaintained:

1. Clone the existing package:
```bash
git clone ssh://aur@aur.archlinux.org/lem.git
cd lem
```

2. Copy your PKGBUILD and .SRCINFO:
```bash
cp ../lem-aur-build/PKGBUILD ../lem-aur-build/.SRCINFO .
```

3. Commit and push:
```bash
git add PKGBUILD .SRCINFO
git commit -m "Take over maintenance: Update to nightly AppImage"
git push
```

## Step 5: Test SSH Connection

```bash
ssh aur@aur.archlinux.org
```

You should see:
```
welcome to the AUR
```

If this fails:
- Verify your public key is added to your AUR account
- Check that `~/.ssh/config` doesn't have conflicting settings
- Ensure the key has correct permissions: `chmod 600 ~/.ssh/id_ed25519`

## Step 6: Update Git Remote (if needed)

If you already have a git repository set up:

```bash
cd /home/thomas/lem-aur-build

# List current remotes
git remote -v

# Add AUR remote (if not present)
git remote add aur ssh://aur@aur.archlinux.org/lem.git

# Set AUR as default push target (optional)
git remote set-url --push origin ssh://aur@aur.archlinux.org/lem.git
```

## Step 7: Verify .SRCINFO is Generated

Before pushing, make sure you have `.SRCINFO`:

```bash
./update.sh
```

This will:
1. Update the pkgrel
2. Generate `.SRCINFO` using Docker
3. Commit changes
4. Push to AUR

## Step 8: Set Up Automated Updates (Optional)

To automatically update and publish on a schedule, use the scheduler:

```bash
claude-code /schedule
```

Or use cron directly:

```bash
crontab -e
```

Add a line to run daily at 2 AM:
```
0 2 * * * cd /home/thomas/lem-aur-build && ./update.sh >> /tmp/lem-aur-update.log 2>&1
```

## Troubleshooting

### SSH Key Issues

**Problem:** `Permission denied (publickey)`

**Solutions:**
- Verify key is added to AUR account
- Check key file permissions: `ls -la ~/.ssh/id_ed25519`
- Try connecting: `ssh -v aur@aur.archlinux.org` for verbose output

### Git Push Issues

**Problem:** `fatal: The remote end hung up unexpectedly`

**Solutions:**
- Check internet connection
- Try: `git push -u aur main:master` (note: AUR uses `master` not `main`)
- Check git remote: `git remote -v`

### .SRCINFO Generation

**Problem:** Docker fails or .SRCINFO not created

**Solutions:**
- Ensure Docker is running: `docker ps`
- Try building Docker image manually: `docker build -t lem-aur-builder .`
- Check PKGBUILD syntax: `cat PKGBUILD | head -20`

## AUR Package Maintenance

Once published, monitor:
- **Arch Forums**: https://bbs.archlinux.org/ - Users may report issues
- **AUR Package Page**: https://aur.archlinux.org/packages/lem - Check comments
- **Git Commits**: Push updates regularly when Lem releases new versions

## References

- AUR Submission Guidelines: https://wiki.archlinux.org/title/AUR_submission_guidelines
- PKGBUILD Manual: https://man.archlinux.org/man/PKGBUILD.5
- AUR FAQ: https://wiki.archlinux.org/title/AUR_FAQ
