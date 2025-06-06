# Contributing to libexecinfo

Thank you for your interest in contributing to libexecinfo! This document provides guidelines and information for contributors.

## 🚀 Getting Started

### Development Environment Setup

```bash
# Clone your fork
git clone https://github.com/your-username/libexecinfo.git
cd libexecinfo

# Add upstream remote
git remote add upstream https://github.com/fam007e/libexecinfo.git

# Set up development build
python gen.py --max-depth 128 --output stacktraverse.c
make DEBUG=1 clean all test
```

## 📋 How to Contribute

### 1. Code Contributions

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Make** your changes with proper tests
4. **Test** your changes: `make clean all test`
5. **Commit** your changes: `git commit -m 'Add amazing feature'`
6. **Push** to your branch: `git push origin feature/amazing-feature`
7. **Submit** a pull request

### 2. Bug Reports

When reporting bugs, please include:
- Operating system and version
- Compiler version
- Steps to reproduce
- Expected vs actual behavior
- Minimal test case if possible

### 3. Feature Requests

For feature requests, please:
- Check existing issues first
- Provide clear use case and motivation
- Consider backward compatibility
- Discuss implementation approach

## 🧪 Testing Requirements

All contributions must:
- Pass existing tests: `make test`
- Include tests for new functionality
- Maintain or improve code coverage
- Work on all supported architectures

### Running Tests

```bash
# Full test suite
make clean all test

# Debug build tests
make DEBUG=1 clean all test

# Performance tests
make DEBUG=0 clean all test
```

## 📝 Code Style

### C Code Guidelines

- **C11 standard** compliance
- **4-space indentation** (no tabs)
- **80-character** line limit where reasonable
- **Function documentation** using doxygen style
- **Error handling** for all functions
- **Memory safety** practices

### Python Code Guidelines

- **PEP 8** compliance
- **Type hints** for all functions
- **Docstrings** for all functions
- **Error handling** with proper exceptions

## 🏗️ Build System

### Makefile Changes

When modifying the Makefile:
- Maintain POSIX compatibility
- Support all existing variables
- Test on multiple systems
- Update documentation

### Code Generation

The `gen.py` script generates `stacktraverse.c`:
- Keep backward compatibility
- Validate all parameters
- Handle edge cases gracefully
- Maintain performance

## 📚 Documentation

### Required Documentation

- **Function documentation** in headers
- **README updates** for new features
- **Example code** for new functionality
- **Man pages** for significant changes

### Documentation Style

- Clear, concise language
- Complete code examples
- Cross-references where helpful
- Proper markdown formatting

## 🔒 Security Considerations

### Security Requirements

- **Input validation** for all public functions
- **Buffer overflow** protection
- **Memory safety** practices
- **Signal safety** for appropriate functions

### Security Review Process

All security-related changes require:
- Thorough testing with sanitizers
- Code review by maintainers
- Documentation of security implications

## 🎯 Performance Guidelines

### Performance Requirements

- No performance regressions
- Benchmark significant changes
- Consider memory usage
- Optimize hot paths

### Performance Testing

```bash
# Performance benchmark
make DEBUG=0 clean all
./test  # Includes performance tests
```

## 📋 Pull Request Guidelines

### Before Submitting

- [ ] Tests pass locally
- [ ] Code follows style guidelines
- [ ] Documentation is updated
- [ ] Commit messages are clear
- [ ] No merge conflicts

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tests pass
- [ ] New tests added
- [ ] Performance tested

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
```

## 🏷️ Release Process

Releases follow semantic versioning (MAJOR.MINOR.PATCH):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

## 📞 Communication

- **GitHub Issues**: Primary communication
- **Email**: faisalmoshiur@gmail.com for sensitive issues
- **Code Review**: Through pull requests

## 🙏 Recognition

Contributors will be:
- Listed in CONTRIBUTORS file
- Mentioned in release notes
- Credited in significant features

Thank you for contributing to libexecinfo! 🎉
